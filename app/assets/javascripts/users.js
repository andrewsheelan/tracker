latitude = 0;
longitude = 0;
function getLocation()
{
  if (navigator.geolocation)
  {
    navigator.geolocation.getCurrentPosition(showPosition);
  }
}
function showPosition(position)
{
  latitude= position.coords.latitude;
  if(document.getElementById('user_latitude'))
    document.getElementById('user_latitude').value = latitude;

  longitude= position.coords.longitude;
   if(document.getElementById('user_longitude'))
    document.getElementById('user_longitude').value = longitude;
}

$(document).ready(function(){
  getLocation();
});
