<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->library('m_db');
		$this->load->model('login_model');
	}
	
	function index()
	{
		$ref=$this->input->get('ref');
		$this->form_validation->set_rules('username','Username','required');
		$this->form_validation->set_rules('password','Password','required');
		if($this->form_validation->run()==TRUE)
		{
			$username=$this->input->post('username',TRUE);
			$password=$this->input->post('password',TRUE);
			if($this->login_model->user_login($username,$password)==TRUE)
			{				
				$akses=$this->login_model->user_info('akses');
				if($akses=="member")
				{
					if(empty($ref))
					{
						redirect(base_url());
					}else{
						redirect($ref);
					}
				}else{
					redirect(base_url().$akses.'/dashboard');
				}				
			}else{
				$this->session->set_flashdata('info','Gagal login karena kesalahan username dan password');
				if(empty($ref))
				{
					redirect(base_url().'login');
				}else{
					redirect(base_url().'login').'?ref='.$ref;
				}
			}
		}else{
			$app=baca_konfig('nama-aplikasi');
			$meta['judul']=$app." | User Login";
			$meta['appname']=$app;
			$this->load->view('tema/login',$meta);
		}		
	}
	
	function android()
	{
		
		{
			
			$username=$this->input->post('email',TRUE);
			$password=$this->input->post('password',TRUE);
			$array = $this->login_model->user_android_login($username,$password);
			
			$callback = $this->input->get('callback',TRUE);
			if(empty($callback)){
				$this->output->set_output(json_encode($array));
			}else{
				$this->output->set_output($callback."(".json_encode($array).")");
			}
			
			//print_r($_POST);
			//print_r($_GET);
			//echo $this->db->last_query();
			//echo $username.$password;
			
		}	
	}
	
	function logout()
	{
		$this->login_model->user_logout();
	}
}