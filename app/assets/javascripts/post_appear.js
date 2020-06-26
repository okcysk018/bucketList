$(document).on('turbolinks:load', function(){

  // 読込中の表示
  function buildLoadingSpinner(){
    const html = `<div class='spinner-center'>
                    <div class="spinner-border" role="status">
                      <span class="sr-only">Loading...</span>
                    </div>
                  </div>`
    return html;
  }

  // NOTE:1枚ずつカードをフェードインさせてjscrollで次ページの情報を展開→再読込する関数
  function cardAppearByOne() {
    var timer;
    var count = $(".card").length;
    var index = 0;
    timer = setInterval(function() {
    // NOTE:'display':'block'では挙動不審になる
    $(".card").eq(index).css({'display':'inline-block'});
    $(".card").eq(index).addClass('animate__fadeInDown');
      index ++;
      if(index == count) {
        clearInterval(timer);
      };
    }, 200);
  }

  function jscrollReader() {
    $('.jscroll').jscroll({
      // 無限に追加する要素を、どこに入れるか
      // contentSelector: '.jscroll',
      contentSelector: '.card-list',
      // 次のページにいくためのリンクの場所 ＞aタグの指定
      // nextSelector: 'span.next a',
      nextSelector: 'a.next',
      // 読込中の表示
      loadingHtml: buildLoadingSpinner()
    });
  }

  // 初期表示
  cardAppearByOne();

  // FIXME:多重読み込みでしか３ページ以降は表示されない
  $(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
      // console.log('scroll') // REVIEW
      cardAppearByOne();
      jscrollReader();
    }
  });

});
