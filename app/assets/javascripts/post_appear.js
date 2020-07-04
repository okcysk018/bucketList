$(document).on('turbolinks:load', function(){

  // $('.card-list').imagesLoaded(function(){
    $('.card-list').imagesLoaded(function(){
      // FIXME:フェードイン実装でレスポンシブ不可に
      // $(".card").addClass('animate__fadeInUp');
      $(".card").css({'opacity':'1'});
      $('.card-list').masonry({
        itemSelector: '.card',
        columnWidth: 250,
        fitWidth: true  //親要素の幅に合わせてカラム数を自動調整
      });
    })
  // })

  // カードの整列
  function postCardAppend(){
    $('.card-list').imagesLoaded(function(){
      // cardAppearByOne();
      $(".card").css({'display':'none'});
      // $('.card-list').append($(".jscroll-added"));
      $('.card-list').imagesLoaded(function(){
        $(".card").css({'opacity':'1'});
        $(".card").css({'display':'inline'});
        $(".card").addClass('animate__fadeInUp');
        $('.card-list').masonry({
          itemSelector: '.card',
          columnWidth: 250,
          isFitWidth: true  //親要素の幅に合わせてカラム数を自動調整
        });
      })
    })
  }

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
      // $(".card").eq(index).css({'opacity':'1'});
      $(".card").eq(index).addClass('animate__fadeInUp');
      index ++;
      if(index == count) {
        clearInterval(timer);
      };
    }, 200);
  }

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

//   // 初期表示
//   cardAppearByOne();

  // // FIXME:多重読み込みでしか３ページ以降は表示されない
  $(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
      // console.log($('a.next')) // REVIEW
      // postCardAppend();
      // jscrollReader();
      // postCardAppend();
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
    }
  });

});
