
<?php
if(empty($data))
{
	redirect(base_url(akses().'/transaksi/orderan'));
}
foreach($map as $row2){	
}
?>
<!DOCTYPE html>
<html>
  <head>
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
  </head>
  <body>
    <h3>Lokasi Pengiriman</h3>
    <div id="map"></div>
    <script>
      function initMap() {
		var posisi = {lat: <?=$row2->lat;?>, lng: <?=$row2->lng;?>};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: posisi
        });
		/*
        var marker = new google.maps.Marker({
          position: posisi,
          map: map,
		  label: {
				text: '<?=$row->alamat;?>',
				color: 'red',
				// Add in the custom label here
				fontFamily: 'Roboto, Arial, sans-serif'
			},
		  icon: '<?=base_url();?>assets/images/delivery.png'
        });
		*/
		var contentString = '<?=$row2->alamat;?>';
        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        var marker = new google.maps.Marker({
          position: posisi,
          map: map,
          title: 'Lokasi Pelanggan',
		  icon: '<?=base_url();?>assets/images/delivery.png'
        });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
		infowindow.open(map,marker);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIlbf77cT66zSC8bGEvLQNaYPSCybJonI&callback=initMap">
    </script>
  </body>
</html>