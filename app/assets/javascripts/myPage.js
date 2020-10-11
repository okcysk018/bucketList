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
  var myDoughnutChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ["達成済","未達成"],
      datasets: [{
          label: "目標数",
          // dataにカウントをいれる
          data: [1,2],
          backgroundColor: [
            '#28a745',
            '#17a2b8',
        ],
      }]
    },
    options: {
      cutoutPercentage: 70,
    }
  });
});
