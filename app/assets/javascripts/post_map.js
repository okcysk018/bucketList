let mapInstance

function initMap(){
  let mapInstance = new google.maps.Map(document.getElementById('map'), {
  center: {lat: -34.397, lng: 150.644},
  zoom: 8
  });
}

// $(document).on('turbolinks:load', function(){
// });