<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('toko_user'))
{
	function toko_user()
	{
		$CI=& get_instance();
		$CI->load->model('toko_model','mod_toko');
		$pusat=$CI->mod_toko->toko_pusat();
		$toko=user_info('toko_id');
		if(empty($toko))
		{
			$toko=$pusat;
		}
		return $toko;
	}
}

if(!function_exists('toko_pusat'))
{
	function toko_pusat()
	{
		$CI=& get_instance();
		$CI->load->model('toko_model','mod_toko');
		$pusat=$CI->mod_toko->toko_pusat();		
		return $pusat;
	}
}

if(!function_exists('toko_info'))
{
	function toko_info($tokoID,$output)
	{
		$CI=& get_instance();
		$CI->load->model('toko_model','mod_toko');
		$data=$CI->mod_toko->toko_data(array('toko_id'=>$tokoID));
		foreach($data as $row){			
		}
		$item=$row->$output;
		return $item;
	}
}

if(!function_exists('produk_stok_data'))
{
	function produk_stok_data($tokoID,$produkID)
	{		
		$CI=& get_instance();		
		$s=array(
		'produk_id'=>$produkID,
		'toko_id'=>$tokoID,
		);
		$d=$CI->m_db->get_data('produk_stok',$s);
		return $d;
	}
}

if(!function_exists('toko_stok'))
{
	function toko_stok($tokoID,$group=array())
	{		
		$CI=& get_instance();		
		$s=array(		
		'toko_id'=>$tokoID,
		);
		$d=$CI->m_db->get_data('produk_stok',$s,'produk_id ASC',$group);
		return $d;
	}
}

if(!function_exists('produk_info'))
{
	function produk_info($produkID,$output)
	{
		$CI=& get_instance();
		$s=array(
		'produk_id'=>$produkID,
		);
		$item=$CI->m_db->get_row('produk',$s,$output);
		return $item;
	}
}

if(!function_exists('produk_photo'))
{
	function produk_photo($produkID,$limit=null)
	{
		$CI=& get_instance();
		$s=array(
		'produk_id'=>$produkID,
		);
		$d=$CI->m_db->get_data('produk_photo',$s,array(),array(),$limit);
		return $d;
	}
}

if(!function_exists('ongkos_kirim'))
{
	function ongkos_kirim($kurir,$dari,$tujuan,$berat=1000)
	{
		$CI=& get_instance();
		$CI->load->library('rajaongkir');
		$json=$CI->rajaongkir->cost($dari, $tujuan, $berat, $kurir);
		$decode=json_decode($json,TRUE);
		$status=$decode['rajaongkir']['status']['code'];
		if($status==200)
		{
			return $decode['rajaongkir']['results'];
		}else{
			return 0;
		}
	}
}

if(!function_exists('produk_kategori'))
{
	function produk_kategori()
	{
		$CI=& get_instance();
		$CI->load->model('produk_model','mod_produk');
		$d=$CI->mod_produk->kategori_data();
		return $d;
	}
}

if(!function_exists('produk_kategori_data'))
{
	function produk_kategori_data($kategori,$limit)
	{
		$CI=& get_instance();
		$s=array(
		'kategori_id'=>$kategori,
		);
		$d=$CI->m_db->get_data('produk',$s,'produk_id DESC',array(),$limit);
		return $d;
	}
}

if(!function_exists('produk_best_seller'))
{
	function produk_best_seller($limit)
	{
		$CI=& get_instance();
		$s=array(
		'jumlah_beli > '=>0,
		);
		$d=$CI->m_db->get_data('produk',$s,'jumlah_beli DESC',array(),$limit);
		return $d;
	}
}

if(!function_exists('produk_terbaru'))
{
	function produk_terbaru($limit)
	{
		$CI=& get_instance();		
		$d=$CI->m_db->get_data('produk',array(),'','',$limit);
		return $d;
	}
}

if(!function_exists('pelanggan_info'))
{
	function pelanggan_info($output='pelanggan_id')
	{
		$CI=& get_instance();
		$o="";
		if(akses()=="member")
		{
			$userid=user_info('user_id');
			$s=array(
			'user_id'=>$userid,
			);
			$o=$CI->m_db->get_row('pelanggan',$s,$output);
		}
		return $o;
	}
}

if(!function_exists('pelanggan_info_custom'))
{
	function pelanggan_info_custom($pelangganid,$output='pelanggan_id')
	{
		$CI=& get_instance();		
		$s=array(
		'pelanggan_id'=>$pelangganid,
		);
		$o=$CI->m_db->get_row('pelanggan',$s,$output);
		return $o;
	}
}

if(!function_exists('produk_promo_id'))
{
	function produk_promo_id($produkID)
	{
		$tgl_ini=date("Y-m-d");
		$CI=& get_instance();
		$s=array(
		'produk_id'=>$produkID,
		);
		$sql="SELECT promo_data.* FROM promo_data LEFT JOIN produk ON promo_data.produk_id = produk.produk_id left join promo on promo.promo_id=promo_data.promo_id Where promo.selesai >= '$tgl_ini' and promo_data.produk_id=$produkID";
		$promoID=$CI->m_db->get_query_row($sql,'promo_id');
		//$promoID=$CI->m_db->get_row('promo_data',$s,'promo_id');
		return $promoID;
	}
}

if(!function_exists('cek_promo_id'))
{
	function cek_promo_id($produkID,$tanggal)
	{
		$CI=& get_instance();
		$sql="SELECT promo.mulai,promo.selesai,promo.nilai FROM promo_data LEFT JOIN produk ON promo_data.produk_id = produk.produk_id left join promo on promo.promo_id=promo_data.promo_id Where promo.mulai <='$tanggal' and promo.selesai >= '$tanggal' and promo_data.produk_id=$produkID";
		$promoID=$CI->m_db->get_query_data($sql);
		return $promoID;
	}
}

if(!function_exists('sendEmail'))
{
	function sendEmail($fromname,$to=array(),$subject,$body) {
		
		$CI=& get_instance();
		$CI->load->library('PHPMailerAutoload');
		$mail = new PHPMailer();
		$mail->SMTPDebug = 2;
		$mail->Debugoutput = 'html';
		// set smtp
		$mail->isSMTP();
		$mail->Host = 'smtp.gmail.com';
		$mail->Port = '587';
		$mail->SMTPAuth = true;
		$mail->Username = 'buanamegahpapermills@gmail.com';
		$mail->Password = 'bu4n4m3g4h';
		//$mail->SMTPSecure = 'tls';
		//$mail->WordWrap = 50;  
		// set email content
		$mail->setFrom('rizal_aditiya@yahoo.com.sg', $fromname);
		foreach($to as $address){
			$mail->addAddress($address);
		}
		$mail->Subject = $subject;
		$mail->msgHTML($body);
		if (!$mail->send()) {
			return $mail->ErrorInfo;
		} else {
			return "Message sent!";
		}
		
	}
}
