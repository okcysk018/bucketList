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

  var $grid = $('.card-list').masonry({
    itemSelector: '.card',
    columnWidth: 250,
    fitWidth: true  //親要素の幅に合わせてカラム数を自動調整
  });

  var msnry = $grid.data('masonry');

  $('.card-list').imagesLoaded(function(){
    $grid.infiniteScroll({
    path: '.next',
    append: '.card',
    outlayer: msnry,
    status: '.page-load-status',
    history: false,
    animate: true,
    // prefill: true,
    scrollThreshold: 500,
    });
  })

  // $('.card-list').imagesLoaded(function(){
    // $('.card-list').imagesLoaded(function(){
    //   // $(".card").addClass('animate__fadeInUp');
    //   $(".card").css({'opacity':'1'});
    //   // cardAppearByOne();
    //   $('.card-list').masonry({
    //     itemSelector: '.card',
    //     columnWidth: 250,
    //     fitWidth: true  //親要素の幅に合わせてカラム数を自動調整
    //   });
    // })
  // })

  // NOTE:1枚ずつカードをフェードインさせてjscrollで次ページの情報を展開→再読込する関数
  function cardAppearByOne() {
    var timer;
    var count = $(".card").length;
    var index = 0;
    timer = setInterval(function() {
      // $(".card").eq(index).css({'opacity':'1'});
      $(".card").eq(index).addClass('animate__fadeInUp');
      index ++;
      if(index == count) {
        clearInterval(timer);
      };
    }, 200);
  }

  // FIXME:jscrollだと読み込み後の表示がおかしい→infiniteScrollで実装
  function jscrollReader() {
    // card-list
    //    jscroll-inner
    //      jscroll
    //        card
    //      jscroll-added
    //        jscroll
    //          card
    // $('.jscroll').jscroll({
    $('.card-list').jscroll({
      // contentSelector: '.jscroll', // 無限に追加する要素の指定
      contentSelector: '.card-list',
      // nextSelector: 'span.next a',
      nextSelector: 'a.next', // 次のページにいくためのリンクのaタグの指定
      // autoTrigger: true, // 次の表示コンテンツの読み込みを自動( true )か、ボタンクリック( false )にする
      // padding: 0, // autoTriggerがtrueの場合、指定したコンテンツの下から何pxで読み込むか指定
      loadingHtml: buildLoadingSpinner() // 読込中の表示
    });
  }

  // // FIXME:Ajaxだと次ページの読み込み情報を範囲指定できない
  $(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    // if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
      // $.ajax({
      //   url: "posts/",
      //   type: "GET",
      //   data: { page: window.paging },
      //   dataType: "html",
      //   beforeSend: function buildLoadingSpinner(){
      //                 const html = `<div class='spinner-center'>
      //                                 <div class="spinner-border" role="status">
      //                                   <span class="sr-only">Loading...</span>
      //                                 </div>
      //                               </div>`
      //                 return html;
      //               },
      //   success: function(data){
      //     if (data != '') {
      //       $container = $('.card-list');
      //       $container.imagesLoaded(function(){
      //         var el = $(data);
      //         el.css('display', 'none');
      //         $container.append(el);
      //         $container.imagesLoaded(function(){
      //           el.css('display', 'inline');
      //           $container.masonry('appended', el, true);
      //           // $('#read-more').text("もっと読む");
      //         });
      //       });
      //     } else {
      //       // $('#read-more').text("もう投稿はありません");
      //       console.log("もう投稿はありません");
      //     }
      //   },
      //   error: function(data){
      //     console.log("some error occured! majioco! punpunmaru!");
      //   }
      // });
    // }
  });

});
