$(document).on('turbolinks:load', function(){
  console.log("TODO:起動確認");
  $(".field").autocomplete({
    source: "/posts/autocomplete", //サジェストで表示させる値の取得先
    autoFocus: true, //取得した値（サジェストの候補）に自動でフォーカスする
    minLength: 1 //1文字入力すればサジェスト機能が動くようにする
  })
});