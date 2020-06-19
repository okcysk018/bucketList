// WARN:require_treeの読込順によるpost_tasks.js読込エラー回避のためapplication.jsで直接指定
$(document).on('turbolinks:load',

  // let mapInstance
  function initMap(){
    // $(".input-address").on('keyup', function(){

    if (gon.geocorder == null){
      gon.geocorder = [0, 0]
    }
    let coordinates = {lat: gon.geocorder[0], lng: gon.geocorder[1]};

    let mapInstance = new google.maps.Map(document.getElementById('map'), {
    center: coordinates,
    // center: {lat: -34.397, lng: 150.644},
    zoom: 8
    });

    let marker = new google.maps.Marker({
      position: coordinates,
      map: mapInstance
    });
  }
);
