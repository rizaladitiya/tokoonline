<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Depan extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->library('m_db');
	}
	
	function index()
	{
		$meta['judul']="Promo | ".baca_konfig('nama-aplikasi');
		$meta['judulhalaman']="Promo Hari ini";
		$meta['homepage']=TRUE;
		$this->load->view('html/header',$meta);
		$this->load->view('html/page/homepage');
		$this->load->view('html/footer');
	}
}