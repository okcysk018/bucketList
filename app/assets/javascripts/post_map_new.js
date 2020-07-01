// $(document).on('turbolinks:load',function(){
//   $('.formContent').on('keyup', '#post-address', function initAutocomplete(){
$(document).on('turbolinks:load', function(){
  function initAutocomplete(){
    var autocomplete;
    //対応させるテキストボックス
    var input = document.getElementById('post-address');
    //オートコンプリートのオプション
    var options = {
      // types: ['(regions)'],                      // 検索タイプ
      types: ['geocode', 'establishment'],                      // 検索タイプ
      // componentRestrictions: {country: 'jp'}     // 日本国内の住所のみ
    };
    autocomplete = new google.maps.places.Autocomplete( input, options);
  }

  initAutocomplete();
});
// });

//   // HACK:geocorderAPI
//   $('.formContent').on('change', '#post-address', function(){
//     var geocoder = new google.maps.Geocoder();      // geocoderのコンストラクタ
//     var place = $('#post-address').val();
//     geocoder.geocode( { 'address': place}, function(results, status) {
//       if (status == 'OK') {
//         // // 緯度経度を取得
//         // var latlng = results[0].geometry.location;
//         // // 住所を取得
//         // var address = results[0].formatted_address;
//         // console.log(results[0].geometry)
//         //     geocoder.geocode({
//         //       address: place
//         //     }, function(results, status) {
//         //       if (status == google.maps.GeocoderStatus.OK) {

//         //         var bounds = new google.maps.LatLngBounds();

//         // for (var i = 0; i < 5; i++) {
//         // for (var i in results) {
//         //   if (results[0].geometry) {
//             // 緯度経度を取得
//             var latlng = results[0].geometry.location;
//             console.log(latlng)
//             // 住所を取得
//             var address = results[0].formatted_address;
//             console.log(address)

//             var data = [address]
//             $('#post-address').autocomplete({
//               source: data,
//               autoFocus: true,
//               delay: 300,
//               minlength: 1
//             });

//         //   }
//         // }

//       } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
//         // alert("検索結果がありません");
//         var data = ["検索結果がありません"]
//         $('#post-address').autocomplete({
//           source: data,
//           autoFocus: true,
//           delay: 300,
//           minlength: 1
//         });

//       } else {
//         console.log(status)
//         // alert("エラー発生 reason: " + status);
//       }
//     });

//   });


// });

// var map;
// var marker;
// // var infoWindow;

// function initMap() {

//   //マップ初期表示の位置設定
//   var target = document.getElementById('map');
//   var centerp = {lat: 37.67229496806523, lng: 137.88838989062504};

//   //マップ表示
//   map = new google.maps.Map(target, {
//     center: centerp,
//     zoom: 2,
//   });

//   // 新規画面での補完処理
//   document.getElementById('post-address').addEventListener('keyup', function() {

//     var place = document.getElementById('post-address').value;
//     var geocoder = new google.maps.Geocoder();      // geocoderのコンストラクタ

//     geocoder.geocode({
//       address: place
//     }, function(results, status) {
//       if (status == google.maps.GeocoderStatus.OK) {

//         var bounds = new google.maps.LatLngBounds();

//         for (var i in results) {
//           if (results[0].geometry) {
//             // 緯度経度を取得
//             var latlng = results[0].geometry.location;
//             // 住所を取得
//             var address = results[0].formatted_address;
//             // 検索結果地が含まれるように範囲を拡大
//             bounds.extend(latlng);
//             // マーカーのセット
//             setMarker(latlng);
//             // マーカーへの吹き出しの追加
//             setInfoW(place, latlng, address);
//             // マーカーにクリックイベントを追加
//             markerEvent();
//           }
//         }
//       }
//     });
//   });
// }

// // マーカーのセットを実施する
// function setMarker(setplace) {
//   // 既にあるマーカーを削除
//   deleteMakers();

//   var iconUrl = 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png';
//     marker = new google.maps.Marker({
//       position: setplace,
//       map: map,
//       icon: iconUrl
//     });
//   }

//   //マーカーを削除する
//   function deleteMakers() {
//     if(marker != null){
//       marker.setMap(null);
//     }
//     marker = null;
//   }

//   // マーカーへの吹き出しの追加
//   function setInfoW(place, latlng, address) {
//     infoWindow = new google.maps.InfoWindow({
//     content: "<a href='http://www.google.com/search?q=" + place + "' target='_blank'>" + place + "</a><br><br>" + latlng + "<br><br>" + address + "<br><br><a href='http://www.google.com/search?q=" + place + "&tbm=isch' target='_blank'>画像検索 by google</a>"
//   });
// }

// // クリックイベント
// function markerEvent() {
//   marker.addListener('click', function() {
//     infoWindow.open(map, marker);
//   });
// }
