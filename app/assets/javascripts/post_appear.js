$(document).on('turbolinks:load', function(){

  // TODO:カードのフェードイン実装 cardのdisplay:noneが必要だが挙動不審になる
  // var timer;
  // var count = $(".card").length;
  // var index = 0;
  // timer = setInterval(function() {
  // //   // $(".card").eq(index).fadeIn('slow');
  // // $(".card").eq(index).css({'width':'15rem'});
  // // $(".card").eq(index).css({'display':'block'});
  // $(".card").eq(index).addClass('animate__fadeInDown');
  //   index ++;
  //   if(index == count) {
  //     clearInterval(timer);
  //   };
  // }, 200);

  function buildLoadingSpinner(){
    const html = `<div class='spinner-center'>
                    <div class="spinner-border" role="status">
                      <span class="sr-only">Loading...</span>
                    </div>
                  </div>`
    return html;
  }

    $('.jscroll').jscroll({
      // 無限に追加する要素は、どこに入れる？
      contentSelector: '.jscroll',
      // 次のページにいくためのリンクの場所は？ ＞aタグの指定
      // nextSelector: 'span.next a',
      nextSelector: 'a.next',
      // nextSelector: 'span.next:last a',
      // 読み込み中の表示はどうする？
      loadingHtml: buildLoadingSpinner()
    });

    $(window).on('scroll', function() {
      // console.log($("span.next a")) // REVIEW:debug用
      scrollHeight = $(document).height();
      scrollPosition = $(window).height() + $(window).scrollTop();
      if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.1) {
        console.log('TODO:')

        // TODO:カードのフェードイン実装 cardのdisplay:noneが必要だが挙動不審になる
        // $(".jscroll").css({'display':'block'});
        // var timer;
        // var count = $(".card").length;
        // var index = 0;
        // timer = setInterval(function() {
        //   // $(".card").eq(index).css({'width':'15rem'});
        //   $(".card").eq(index).css({'display':'block'});
        //   // $(".card-body").eq(index).css({'display':'block'});
        //   // $(".card-footer").eq(index).css({'display':'block'});
        //   $(".card").eq(index).addClass('animate__fadeInDown');
        //   index ++;
        //   if(index == count) {
        //     clearInterval(timer);
        //   };
        // }, 200);

        $('.jscroll').jscroll({
          contentSelector: '.jscroll',
          // nextSelector: 'span.next:last a',
          // nextSelector: 'span.next a',
          nextSelector: 'a.next',
          loadingHtml: buildLoadingSpinner()
        });
      }
    });

});
