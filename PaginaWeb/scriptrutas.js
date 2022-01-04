function iniciarMap(){
    var coord = {lat:19.0413 ,lng: -98.2062};
    var map = new google.maps.Map(document.getElementById('map'),{
      zoom: 10,
      center: coord
    });
    var marker = new google.maps.Marker({
      position: coord,
      map: map
    });
    maker = new google.maps.Marker({
     position: myLating,
      map,
      title: "Hola mundo"
    });
    getposition();
    marker.setPosition(myLating);
    
}
 function getposition(){
  if(navigator.geolocation){
      var options = {timeout:60000}
      geoLoc = navigator.geolocation;
      watchID = geoLoc.watcPosition(showLocationOnMap,errorHandler, options);

  }else{
    alert("Lo siento no soporta Mapas")
  }
  }
function showLocationOnMap(position){
  var latitud = position.coord.latitud;
  var longitud = position.coord.longitud;

  const myLating={"lat:":latitud+"lng:"+longitud};
  marker.setPosition(myLating);
  map.setCenter(myLating);
}
 

