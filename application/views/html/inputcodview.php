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
echo form_open(base_url('produk/selesai'),array('class'=>'form-horizontal'));
?>
<input type="hidden" name="pelangganid" value="<?=pelanggan_info('pelanggan_id');?>"/>
<div class="row">
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-3 control-label" for="">Kepada</label>
			<div class="col-md-9">
				<p class="form-control-static"><?=user_info('nama');?></p>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label" for="">Alamat</label>
			<div class="col-md-9">
				<p class="form-control-static"><?=pelanggan_info('alamat');?></p>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-3 control-label" for="">Telp</label>
			<div class="col-md-9">
				<p class="form-control-static"><?=pelanggan_info('hp');?></p>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label" for="">Kota</label>
			<div class="col-md-9">
				<p class="form-control-static"><?=field_value('lokasi_kota','kota_id',pelanggan_info('kota'),'nama_kota');?></p>
			</div>
		</div>		
	</div>	
	<div class="col-md-4">
		<b>Total Bayar : </b>
		<h3 id="totalbayar"></h3>		
		<button type="submit" id="oksimpan" class="btn btn-success btn-flat" style="display: none">Pembayaran</button>
	</div>
</div>
<hr style="border-bottom: 1px dotted #ccc"/>
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
				<td colspan="4">Total</td>
				<td>
					Rp <?=number_format($this->cart->total(),0);?>
				</td>
			</tr>
		</tfoot>
		</table>

</div>
<div id="map"></div>

<input type="hidden" name="total" id="total" value="<?=$this->cart->total();?>"/>
<input type="hidden" name="ongkir" id="ongkir" value="0"/>
<input type="hidden" name="berat" value="<?=$berat;?>"/>
<input type="hidden" name="diskonnilai" id="diskonnilai" value="<?=$promo;?>"/>
<input type="text" name='lat' id='lat' class='input-xlarge' />
<input type="text" name='lng' id='lng' class='input-xlarge' />
<?php
echo form_close();
?>
<script>
function updateMarkerPosition(latLng) {
		document.getElementById('lat').value = [latLng.lat()];
		document.getElementById('lng').value = [latLng.lng()];
	}

 
	
    var myOptions = {
      zoom: 12,
        scaleControl: true,
      center:  new google.maps.LatLng(-7.791446,110.366909),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

	
    var map = new google.maps.Map(document.getElementById("map"),
        myOptions);

	var marker1 = new google.maps.Marker({
	position : new google.maps.LatLng(-7.791446,110.366909),
	title : 'lokasi',
	map : map,
	draggable : true
	});
	
	//updateMarkerPosition(latLng);

	google.maps.event.addListener(marker1, 'drag', function() {
		updateMarkerPosition(marker1.getPosition());
	});
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIlbf77cT66zSC8bGEvLQNaYPSCybJonI&callback=initMap">
    </script>

<?php
}else{
	redirect(base_url().'keranjang');
}
?>
