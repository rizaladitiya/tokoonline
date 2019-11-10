<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Download extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->helper(array('url','download'));	
	}
	
	public function index(){		
		//$data = file_get_contents(base_url('assets/PandaanOjek.apk'));
		//$name = "PandaanOjek.apk";
		//force_download($name,$data);
		redirect("https://drive.google.com/open?id=1dR9E31qjsjp7xWNOYi3sYUKghs8XAM_2");
	}	
}