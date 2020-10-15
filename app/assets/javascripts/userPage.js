$(document).on('turbolinks:load', function(){
  // $('.post-list').infiniteScroll({
  //   path: '.next',
  //   append: '.post-data',
  //   status: '.page-load-status',
  //   history: false,
  //   animate: true,
  //   scrollThreshold: 500,
  // });

  // ドーナツチャート
  var ctx = document.getElementById("myChart").getContext('2d');

  Chart.plugins.register({
    afterDatasetsDraw: function(chartInstance, easing) {
      if (chartInstance.config.type == "doughnut") {
        var ctx = chartInstance.chart.ctx;
        var sum = 0;
        chartInstance.data.datasets.forEach(function (dataset, i) {
          var meta = chartInstance.getDatasetMeta(i);
          if (!meta.hidden) {
            meta.data.forEach(function(element, index) {
              ctx.fillStyle = 'white';

              var fontSize = 12;
              var fontStyle = 'normal';
              var fontFamily = 'Helvetica Neue';
              ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);


              var dataString = chartInstance.data.labels[index];
              var dataString2 = dataset.data[index];

              ctx.textAlign = 'center';
              ctx.textBaseline = 'middle';

              var padding = 0;
              var position = element.tooltipPosition();

              ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
              ctx.fillText(dataString2, position.x, position.y - (fontSize / 2) - padding + fontSize);

              // 円の中心に表示する合計を集計する
              sum += dataset.data[index];
            });
          }
        });

        var ch = $('#myChart')
        var textWidth = ch.width()/2;
        var textHeight = ch.height()/2 + 10;

        ctx.fillStyle = 'black';
        var fontSize = ch.height() * 9/20;
        var fontStyle = 'normal';
        var fontFamily = "Helvetica Neue";
        ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillText(sum.toString(), textWidth, textHeight);
      }
    }
  });

  const green = '#28a745';
  const blue = '#17a2b8';

  var data = {
    labels: ["未達成", "達成済"],
    datasets: [{
        data: gon.done_flag_count,
        backgroundColor: [blue, green],
        hoverBackgroundColor: [blue, green],
        borderWidth: 0,
        borderColor: 'transparent'
    }]
  }

  // $(window).on('load resize', function () {
  //   draw();
  // });

  // function draw() {
  //   // myDoughnutChartが残ってたら消す
  //   if (myDoughnutChart) {
  //     myDoughnutChart.destroy();
  //   }

    var myDoughnutChart = new Chart(ctx, {
      type: 'doughnut',
      data: data,
      options: {
        cutoutPercentage: 60,
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: false,
          onClick: function(event, legendItem) {}
        },
        tooltips: {
          enabled: false,
        },
        animation: {
          // animateRotate: false
        },
      },
    })
  // }
});
