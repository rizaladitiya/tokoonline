<html>
<head>
</head>
<body>
	<table>
		<tr>
			<td>Nama</td>
			<td>Peta</td>
			<td>Whatsapp</td>
			<td>Telepon</td>
			<td>Alamat</td>
		</tr>
		<?php 
		if(!empty($all)){
		foreach($all as $row){ ?>
		<tr>
			<td><?=$row->nama_pelanggan;?></td>
			<td><a href='http://maps.google.com/maps?q=loc:<?=$row->lat;?>,<?=$row->lng;?>'>Peta</a></td>
			<td><a href='https://api.whatsapp.com/send?phone=<?=$row->hp;?>'><?=$row->hp;?></a></td>
			<td><td><a href='tel:<?=$row->hp;?>'><?=$row->hp;?></a></td>
			<td><?=$row->alamat;?></td>
		</tr>
		<?php } }?>
	</table>
</body>
</html>