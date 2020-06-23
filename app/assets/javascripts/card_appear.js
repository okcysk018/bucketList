$(document).on('turbolinks:load', function(){

  // NOTE:animate.cssの実装により不要
  // var timer;
  // var count = $(".card").length;
  // var index = 0;
  // timer = setInterval(function() {
  //   $(".card").eq(index).fadeIn('slow');
  //   index ++;
  //   if(index == count) {
  //     clearInterval(timer);
  //   };
  // }, 500);

    $('.jscroll').jscroll({
      // 無限に追加する要素は、どこに入れる？
      contentSelector: '.jscroll',
      // 次のページにいくためのリンクの場所は？ ＞aタグの指定
      nextSelector: 'span.next a',
      // nextSelector: 'span.next:last a',
      // 読み込み中の表示はどうする？
      loadingHtml: '読み込み中'
    });

    $(window).on('scroll', function() {
      // console.log($("span.next a")) // REVIEW:debug用
      scrollHeight = $(document).height();
      scrollPosition = $(window).height() + $(window).scrollTop();
      if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {

        // REVIEW:不要確認
        var timer;
        var count = $(".card").length;
        var index = 0;
        timer = setInterval(function() {
          $(".card").eq(index).fadeIn('slow');
          index ++;
          if(index == count) {
            clearInterval(timer);
          };
        });

        $('.jscroll').jscroll({
          contentSelector: '.jscroll',
          // nextSelector: 'span.next:last a',
          nextSelector: 'span.next a',
          loadingHtml: '読み込み中'
        });
      }
    });

});
