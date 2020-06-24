$(document).on('turbolinks:load', function(){

  var timer;
  var count = $(".card").length;
  var index = 0;
  timer = setInterval(function() {
    // $(".card").eq(index).fadeIn('slow');
    $(".card").eq(index).css({'display':'block'});
    $(".card").eq(index).addClass('animate__fadeInDown');
    index ++;
    if(index == count) {
      clearInterval(timer);
    };
  }, 200);

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

        var timer;
        var count = $(".card").length;
        var index = 0;
        timer = setInterval(function() {
          $(".card").eq(index).css({'display':'block'});
          $(".card").eq(index).addClass('animate__fadeInDown');
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
