<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Histori extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('m_db');
	}
	
	function index()
	{
	}
	
	function ojek()
	{
		if($this->uri->segment(1)=="produk")
		{
			$id=$this->uri->segment(4);
		}else{
			$id=$this->uri->segment(3);	
		}
		$pelanggan=pelanggan_info('user_id');
		$s=array(
		'id'=>$id,
		'user'=>$pelanggan,
		);
		if($this->m_db->is_bof('ojek',$s)==FALSE)
		{			
			$meta['judul']="Status Ojek | ".baca_konfig('nama-aplikasi');
			$meta['judulhalaman']="Status Ojek";
			$meta['homepage']=FALSE;
			$this->load->view('html/header',$meta);
			$d['data']=$this->m_db->get_data('ojek',$s);
			$this->load->view('html/page/tabelview',$d);
			$this->load->view('html/footer');
		}else{
			redirect(base_url().'member/login');
		}	
	}
	function ojekall()
	{
		
		$pelanggan=pelanggan_info('user_id');
		$s=array(
		'user'=>$pelanggan,
		);
		if($this->m_db->is_bof('ojek',$s)==FALSE)
		{			
			$meta['judul']="Status Ojek | ".baca_konfig('nama-aplikasi');
			$meta['judulhalaman']="Status Ojek";
			$meta['homepage']=FALSE;
			$this->load->view('html/header',$meta);
			$d['data']=$this->m_db->get_data('ojek',$s,'jemput desc');
			$this->load->view('html/page/tabelview',$d);
			$this->load->view('html/footer');
		}else{
			redirect(base_url().'member/login');
		}	
	}
	function laundry()
	{
		if($this->uri->segment(1)=="produk")
		{
			$id=$this->uri->segment(4);
		}else{
			$id=$this->uri->segment(3);	
		}
		$pelanggan=pelanggan_info('user_id');
		$s=array(
		'id'=>$id,
		'user'=>$pelanggan,
		);
		if($this->m_db->is_bof('laundry',$s)==FALSE)
		{			
			$meta['judul']="Status Ojek | ".baca_konfig('nama-aplikasi');
			$meta['judulhalaman']="Status Ojek";
			$meta['homepage']=FALSE;
			$this->load->view('html/header',$meta);
			$d['data']=$this->m_db->get_data('laundry',$s);
			$this->load->view('html/page/tabelview',$d);
			$this->load->view('html/footer');
		}else{
			redirect(base_url().'member/login');
		}	
	}
	function laundryall()
	{
		
		$pelanggan=pelanggan_info('user_id');
		$s=array(
		'user'=>$pelanggan,
		);
		if($this->m_db->is_bof('laundry',$s)==FALSE)
		{			
			$meta['judul']="Status Laundry | ".baca_konfig('nama-aplikasi');
			$meta['judulhalaman']="Status Laundry";
			$meta['homepage']=FALSE;
			$this->load->view('html/header',$meta);
			$d['data']=$this->m_db->get_data('laundry',$s,'jemput desc');
			$this->load->view('html/page/tabelview',$d);
			$this->load->view('html/footer');
		}else{
			redirect(base_url().'member/login');
		}	
	}
	
}