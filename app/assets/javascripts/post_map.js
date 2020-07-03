// // WARN:require_treeの読込順によるpost_tasks.js読込エラー回避のためapplication.jsで直接指定
$(document).on('turbolinks:load',

//   // let mapInstance
//   function initMap(){
//     // $(".input-address").on('keyup', function(){

//     if (!gon.geocorder) {gon.geocorder = [0, 0]}
//     let coordinates = {lat: gon.geocorder[0], lng: gon.geocorder[1]};

//     let mapInstance = new google.maps.Map(document.getElementById('map'), {
//       center: coordinates,
//       zoom: 8,
//       mapTypeId: 'roadmap'   //地図の種類
//     });

//     let marker = new google.maps.Marker({
//       position: coordinates,
//       map: mapInstance
//     });
//   }
// );


  // REVIEW:mapが存在しないとgoogle.maps.Mapでエラーになる？
  function initMap() {
    // let mapInstance = new google.maps.Map(document.getElementById('map'), {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 2,
      center: {lat: 35.6828387, lng: 139.7594549},
      // mapTypeControl: false,
      // panControl: false,
      // zoomControl: false,
      // streetViewControl: false
    });

    var request = {
      placeId: $('.post-info__post-placeID').text(),
      // fields: ["name", "formatted_address", "place_id", "geometry"]
      fields: ['icon', "name", "formatted_address", "place_id", "geometry"]
    };

    // TODO:カード実装
    // let infoWindow = new google.maps.InfoWindow({
    //   content: document.getElementById('info-content')
    // });
    var infowindow = new google.maps.InfoWindow();
    var infowindowContent = document.getElementById('infowindow-content');
    infowindow.setContent(infowindowContent);
    var service = new google.maps.places.PlacesService(map);

    service.getDetails(request, function(place, status) {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });
        if (place.geometry.viewport) {
          // 指定された境界を含むようにビューポートを設定
          map.fitBounds(place.geometry.viewport);
        } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        // CHANGED:JSでinfowindow設定する場合
        // google.maps.event.addListener(marker, "click", function() {
          // infowindow.setContent(
          //   "<div><strong>" +
          //     place.name +
          //     "</strong><br>" +
          //     place.formatted_address +
          //     "</div>"
          // );
          // infowindow.open(map, this);
        infowindowContent.children['place-icon'].src = place.icon;
        infowindowContent.children['place-name'].textContent = place.name;
        infowindowContent.children['place-address'].textContent = place.formatted_address;
        infowindow.open(map, marker);
        // });
      }
    });
  });