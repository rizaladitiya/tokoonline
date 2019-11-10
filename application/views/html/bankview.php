<p class="lead">
	Nomer Invoice Anda : <?=$inv;?> <br>Silahkan mentransferkan uang dengan total <b><?=$total;?></b> ke salah satu pilihan bank di bawah ini:
</p>
<div class="row">
<?php
$dBank=$this->m_db->get_data('bank');
if(!empty($dBank))
{
	foreach($dBank as $rBank)
	{
		$logo=base_url().'assets/images/bank/'.$rBank->logo;
	?>	
	<div class="col-xs-6">
		<div class="col-xs-12">
			<div class="col-xs-5">
				<div class="">
					<img src="<?=$logo;?>" class="img-responsive" style="height: 90px;"/>
				</div>
			</div>
			<div class="col-xs-7">
				<strong><?=$rBank->nama_bank;?></strong><br/>
				<strong><?=$rBank->no_rek;?></strong><br/>
				<strong><?=$rBank->pemilik;?></strong>
			</div>
		</div>		
	</div>	
	<?php
	}
}
?>
</div>

<p class="lead">
	Setelah mentransferkan dana, silahkan konfirmasi pembayaran <a href="<?=base_url();?>konfirmasi/<?=$inv;?>">di sini</a> atau copy paste link ini <?=base_url();?>konfirmasi/<?=$inv;?>
</p>