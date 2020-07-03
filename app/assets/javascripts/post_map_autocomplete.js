// $(document).on('turbolinks:load',function(){
//   $('.formContent').on('keyup', '#post-address', function initAutocomplete(){
$(document).on('turbolinks:load', function(){

  //オートコンプリートに対応させるテキストボックス
  var input = document.getElementById('post-address');
  //オートコンプリートのオプション
  var options = {
    types: ['geocode', 'establishment'],       // 検索タイプ
    // componentRestrictions: {country: 'jp'}     // 日本国内の住所のみ
  };

  autocomplete = new google.maps.places.Autocomplete( input, options);

  autocomplete.setFields(['address_components', 'geometry', 'icon', 'name', 'place_id']);

  autocomplete.addListener('place_changed', function() {
    // infowindow.close();
    // marker.setVisible(false);
    var place = autocomplete.getPlace();

    if (!place.geometry) {
      // window.alert("No details available for input: '" + place.name + "'");
      window.alert("'" + place.name + "'の検索結果が見つかりませんでした");
      return;
    }

    $('#post-placeID').val(place.place_id);
  });

  // NOTE:autoCompleteを利用せずにフォーム入力が変更された場合placeIDを空にする
  $('.formContent').on('change', '#post-address', function(){
    $('#post-placeID').val('');
  })

});
// });