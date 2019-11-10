<?php
echo asset_select2();
if(akses()!="member")
{
	redirect(base_url());
}
$berat=0;
$pembelian=$this->cart->contents();

if(!empty($pembelian)){

$tgl_ini=date("Y-m-d");
$this->load->model('produk_model','mod_produk');
$dPromo=$this->mod_produk->promo_data(array('selesai >'=>$tgl_ini),'promo_id DESC');
$promo=0;

?>
<?php
echo validation_errors();
echo form_open(base_url('produk/selesaicod'),array('class'=>'form-horizontal'));
?>
<legend>Item yang akan dikirim</legend>
<input type="hidden" name="pelangganid" value="<?=$data['pelangganid'];?>"/>
<div class="">

		<table class="table table-bordered">
		<thead>
			<th>Nama Produk</th>
			<th width="10%">Jumlah</th>
			<th width="20%">Harga</th>
			<th width="20%">Diskon</th>
			<th width="20%">Sub Total</th>
		</thead>
		<tbody>
			<?php
			$i=0;	
			if(!empty($pembelian))
			{
				foreach($pembelian as $item)
				{
					$i+=1;
					$id=$item['rowid'];
					$berat_tmp=field_value('produk','kode_produk',$item['id'],'berat');
					$produk_id=field_value('produk','kode_produk',$item['id'],'produk_id');
					$berat+=$berat_tmp;
					$produkid=$item['produk_id'];
					$promo_id=produk_promo_id($produkid);
					$promo_nilai=0;
					$harga2=$item['price'];
					$harga=produk_info($produkid,'harga');
					if(!empty($promo_id))
					{
						$promo_nilai=field_value('promo','promo_id',$promo_id,'nilai');						
					}
					$promo+=$promo_nilai;
				?>
				<tr>
					<td>
						<?=$item['name'];?><br/>
						Berat : <?=$berat_tmp;?> gram<br/>
						Keterangan : <?=$item['keterangan'];?>
					</td>
					<td>
						<?=$item['qty'];?>
					</td>
					<td>
						Rp <?=number_format($harga,0);?>
					</td>
					<td>
						Rp <?=number_format($promo_nilai,0);?>
					</td>
					<td>
						Rp <?=number_format($item['subtotal'],0);?>
					</td>			
				</tr>
				<input type="hidden" name="produk[<?=$i;?>][produkid]" value="<?=$produk_id;?>"/>
				<input type="hidden" name="produk[<?=$i;?>][qty]" value="<?=$item['qty'];?>"/>
				<input type="hidden" name="produk[<?=$i;?>][harga]" value="<?=$item['price'];?>"/>
				<input type="hidden" name="produk[<?=$i;?>][keterangan]" value="<?=$item['keterangan'];?>"/>
				<input type="hidden" name="produk[<?=$i;?>][subtotal]" value="<?=$item['subtotal'];?>"/>
				<?php
				}
			}
			?>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">Ongkos Kirim <?=strtoupper($data['kurir'])." ".$data['service'];?></td>
				<td>
					Rp <?=number_format($data['ongkir'],0);?>
				</td>
			<tr>
				<td colspan="4">Total</td>
				<td>
					Rp <?=number_format($this->cart->total()+$data['ongkir'],0);?>
				</td>
			</tr>
		</tfoot>
		</table>
		
<label class="control-label">Alamat</label>
			<div class="">
				<textarea name="alamat" class="form-control" placeholder="Masukkan alamat lengkap disertai petunjuk untuk mempermudah kami mecari lokasi"></textarea>
			</div>
			
		<legend>Pilih Lokasi Pengiriman</legend>
		<div id="googlemap">
		
			<div id="map"></div>
		</div>
</div>


<input type="hidden" name="total" id="total" value="<?=$data['total'];?>"/>
<input type="hidden" name="ongkir" id="ongkir" value="<?=$data['ongkir'];?>"/>
<input type="hidden" name="berat" value="<?=$data['berat'];?>"/>
<input type="hidden" name="diskonnilai" id="diskonnilai" value="<?=$data['diskonnilai'];?>"/>
<input type="hidden" name='lat' id='lat' />
<input type="hidden" name='lng' id='lng' />
<input type="hidden" name="kurir" value="<?=$data['kurir'];?>"/>
<input type="hidden" name="service" value="<?=$data['service'];?>"/>
				<hr style="border-bottom: 1px dotted #ccc"/>
		<div class="form-group">
			<label class="col-sm-2 control-label">&nbsp;</label>
			<div class="col-md-2">
				<button type="submit" id="oksimpan" class="btn btn-success btn-flat">Proses Transaksi</button><br>
			</div>
		</div>
			
<?php
echo form_close();
?>
    <script>
		var map;
        var markersArray = [];
      function initMap() {
        var pandaan = {lat: -7.654121, lng: 112.7014236};
		var myOptions = {
                zoom: 15,
                center: pandaan,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
			
        var map = new google.maps.Map(document.getElementById('map'),myOptions);

		var marker1 = new google.maps.Marker({
	position : new google.maps.LatLng(-7.654121,112.7014236),
	title : 'Lokasi Pengiriman',
	map : map,
	draggable : true,
	icon: '<?=base_url();?>assets/images/delivery.png'
	});
	

	google.maps.event.addListener(marker1, 'drag', function() {
		updateMarkerPosition(marker1.getPosition());
	});
		
      }
		function updateMarkerPosition(latLng) {
		document.getElementById('lat').value = [latLng.lat()];
		document.getElementById('lng').value = [latLng.lng()];
		}
    </script>

<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIlbf77cT66zSC8bGEvLQNaYPSCybJonI&callback=initMap">
    </script>

<?php
}else{
	redirect(base_url().'keranjang');
}
?>
