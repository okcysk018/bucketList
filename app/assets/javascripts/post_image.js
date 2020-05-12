$(document).on('turbolinks:load', function(){

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class= "form-image-box__main__previews__view" data-index="${index}">
                    <div class="form-image-box__main__previews__view__image">
                      <img class="image${index} input_images", data-index="${index}", src="${url}", width: "120px", height: "120px"%>
                        <div class="image-remove form-image-box__main__previews__view__delete">
                          削除
                        </div>
                    </div>
                  </div>`;
    return html;
  }
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="image-file_group">
                    <i class="fa fa-camera"></i>
                    <input class="image-file-uploader" type="file"
                    name="post[images_attributes][${num}][image]"
                    id="post_images_attributes_${num}_image">
                  </div>`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.image-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  // 編集画面描画時の削除チェックボックスを非表示に
  $('.hidden-destroy').hide();

  $('.form-image-box__main').on('change', '.image-file-uploader', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    // FIXME: 画像変更previewも同時に変更できるように要修正
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else if ($('.image-file-uploader').length <= 10) {  // 新規画像追加の処理
      // TODO:画像のバリデーションを10枚に変更
      $('.form-image-box__main__previews').append(buildImg(targetIndex, blobUrl));
      // 配列fileIndexの要素である先頭の数字を使ってinputアップローダを作る
      // TODO: appendでも問題なし？
      $('.form-image-box__main__uploaders__label').prepend(buildFileField(fileIndex[0]));
      // inputアップローダの親要素ごと非表示に（カメラアイコンも非表示にするため)
      $(this).parent().hide();
      // 配列の先頭の要素を削除
      fileIndex.shift();
      // 先頭の要素を削除された配列要素の末尾の数に1足した要素を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    } else {
      // TODO:10枚以上のエラー表示変更＆blobが必要？
      alert("アップロードできる画像の枚数は10枚までです");
      return false;
    }
  });
  // 削除ボタンの設定
  $('.form-image-box__main').on('click', '.image-remove', function() {
    const targetIndex = $(this).prev().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.image-file-uploader').length == 0) $('.form-image-box__main__uploaders__label').prepend(buildFileField(fileIndex[0]));
  });

});