<?php
echo asset_select2();
if(akses()!="member")
{
	redirect(base_url());
}



$tgl_ini=date("Y-m-d");

?>
<?php
echo validation_errors();
echo form_open(base_url('produk/selesaiojek'),array('class'=>'form-horizontal'));
?>
<div class="">
<label class="control-label">Keterangan tambahan</label>
			<div class="form-group">
			<div class="">
				<textarea name="alamat" class="form-control" placeholder="Masukkan keterangan lokasi tambahan dan ciri-ciri Anda untuk mempermudah penjemputan...."></textarea>
			</div>
		
				<button type="submit" id="oksimpan" class="btn btn-success btn-flat">Jemput Sekarang</button><br>
		</div>			
		<legend>Pilih Lokasi Anda</legend>
		<div id="googlemap">
		
			<div id="map"></div>
		</div>
		<input type="hidden" name='lat' id='lat' />
	<input type="hidden" name='lng' id='lng' />
	<input type="hidden" name="pelangganid" value="<?=user_info('user_id');?>"/>
</div>


<?php
echo form_close();
?>
<script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow,marker1;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -7.654121, lng: 112.7014236},
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
			  
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
			/*
            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
			*/
			marker1 = new google.maps.Marker({
		position : new google.maps.LatLng(position.coords.latitude,position.coords.longitude),
		title : 'Lokasi Penjemputan',
		map : map,
		draggable : true,
		content:'Anda',
		icon: '<?=base_url();?>assets/images/ojek.png'
		});
		updateMarkerPosition(marker1.getPosition());
            map.setCenter(pos);
          }, function() {
            //handleLocationError(true, marker1, map.getCenter());
			marker1 = new google.maps.Marker({
		position : new google.maps.LatLng(-7.654121,112.7014236),
		title : 'Lokasi Penjemputan',
		map : map,
		draggable : true,
		content:'Anda',
		icon: '<?=base_url();?>assets/images/ojek.png'
		});
		updateMarkerPosition(marker1.getPosition());
		alert('Error: Anda tidak mengizinkan akes lokasi');
          },
		  {enableHighAccuracy:true, timeout:60000, maximumAge:600000});
		  
        } else {
          // Browser doesn't support Geolocation
          //handleLocationError(false, marker1, map.getCenter());
		  marker1 = new google.maps.Marker({
		position : new google.maps.LatLng(-7.654121,112.7014236),
		title : 'Lokasi Penjemputan',
		map : map,
		draggable : true,
		content:'Anda',
		icon: '<?=base_url();?>assets/images/ojek.png'
		});
		updateMarkerPosition(marker1.getPosition());
		alert('Browser tidak support GPS');
        }
		
	

		google.maps.event.addListener(marker1, 'drag', function() {
			updateMarkerPosition(marker1.getPosition());
		});
      }
		function updateMarkerPosition(latLng) {
		document.getElementById('lat').value = [latLng.lat()];
		document.getElementById('lng').value = [latLng.lng()];
		}
      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>

<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIlbf77cT66zSC8bGEvLQNaYPSCybJonI&callback=initMap">
    </script>

