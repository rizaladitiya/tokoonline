<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Eksekusi extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		//$this->load->helper(array('url','download'));
		$this->load->library('m_db');		
	}
	
	public function index(){		
		show_404("Halaman tidak ditemukan");
	}
	
	public function cekojek(){		
		$s=array(
				'ojek'=>0
			);
		//$all = $this->m_db->get_data('ojek',$s);
		$query="select 
				a.id,
				a.user,
				a.lat,
				a.lng,
				a.alamat,
				a.ojek,
				a.jemput,
				a.proses,
				a.selesai,
				b.pelanggan_id,
				b.nama_pelanggan,
				b.alamat,
				b.hp,
				b.email,
				b.kota,
				b.user_id 
		from ojek a
		inner join pelanggan b on a.user=b.user_id
		where a.ojek=0
		order by jemput asc";
		$all = $this->m_db->get_query_data($query);
		$this->output->set_content_type('application/json');
		$callback = $this->input->get('callback',TRUE);
		if(empty($callback)){
			$this->output->set_output(json_encode($all));
		}else{
			$this->output->set_output($callback."(".json_encode($all).")");
		}
	}
	
	public function cekojekhtml(){		
		$s=array(
				'ojek'=>0
			);
		//$all = $this->m_db->get_data('ojek',$s);
		$query="select 
				a.id,
				a.user,
				a.lat,
				a.lng,
				a.alamat,
				a.ojek,
				a.jemput,
				a.proses,
				a.selesai,
				b.pelanggan_id,
				b.nama_pelanggan,
				b.alamat,
				b.hp,
				b.email,
				b.kota,
				b.user_id 
		from ojek a
		inner join pelanggan b on a.user=b.user_id
		where a.ojek=0
		order by jemput asc";
		$d['all'] = $this->m_db->get_query_data($query);
		$this->load->view('html/cekojek',$d);
	}
	
	public function template(){	
		$id=$this->uri->segment(3);
		$query="select 
				a.id,
				a.user,
				a.lat,
				a.lng,
				a.alamat,
				a.ojek,
				a.jemput,
				a.proses,
				a.selesai,
				b.pelanggan_id,
				b.nama_pelanggan,
				b.alamat,
				b.hp,
				b.email,
				b.kota,
				b.user_id 
		from ojek a
		inner join pelanggan b on a.user=b.user_id
		where a.id=$id
		order by jemput asc";
		$all = $this->m_db->get_query_data($query);
		foreach($all as $row){
		$html="
			<html>
			<head>
			</head>
			<body>
			<a href='http://maps.google.com/maps?q=loc:".$row->lat.",".$row->lng."'>Peta</a><br />
			<a href='https://api.whatsapp.com/send?phone=".$row->hp."'>Whatsapp</a><br />
			<a href='tel:".$row->hp."'>Telephone</a><br />
			
			</body>
			</html>
		";
		}
		echo $html;
	}
	
	public function updateojek(){
		$id=$this->uri->segment(3);		
		$s=array(
				'id'=>$id
			);
		$a=array(
				'ojek'=>1
			);
		$cek = $this->m_db->edit_row('ojek',$a,$s);
		if($cek){
			$all = array('success'=>true);
		} else {
			$all = array('success'=>false);
		}
		$this->output->set_content_type('application/json');
		$callback = $this->input->get('callback',TRUE);
		if(empty($callback)){
			$this->output->set_output(json_encode($all));
		}else{
			$this->output->set_output($callback."(".json_encode($all).")");
		}
	}
	
	public function ceklaundry(){		
		$s=array(
				'laundry'=>0
			);
		$all = $this->m_db->get_data('laundry',$s);
		$this->output->set_content_type('application/json');
		$callback = $this->input->get('callback',TRUE);
		if(empty($callback)){
			$this->output->set_output(json_encode($all));
		}else{
			$this->output->set_output($callback."(".json_encode($all).")");
		}
	}

		
}