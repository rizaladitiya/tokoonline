<?php
if(empty($data))
{
	redirect(base_url());
}

?>

<legend>Histori Ojek
		</legend>
  <table class="table table-bordered">
<thead>
			<th>Tanggal</th>
			<th width="10%">Lokasi</th>
			<th width="20%">Driver</th>
			<th width="20%">Status</th>
		</thead>
		<tbody>
        <?php foreach($data as $value) {?>
				<tr>
					<td><?=$value->jemput;?>
					</td>
					<td>
						<?=$value->alamat;?>
					</td>
					<td>
						<?=$value->ojek;?>
					</td>
					<td>
						<?=$value->proses;?>
					</td>			
				</tr>
        <?php } ?>		
		</tbody>
		</table>
