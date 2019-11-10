<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Email extends CI_Controller {
	function __construct()
	{
		parent::__construct();
        $this->load->library('PHPMailerAutoload');
		set_time_limit(0);
	}
	function index(){
		echo "asd";
	}
	function testmail(){
        
        $mail = new PHPMailer();
        $mail->SMTPDebug = 2;
        $mail->Debugoutput = 'html';
        
        // set smtp
        $mail->isSMTP();
        $mail->Host = 'mail.toserba.my.id';
		$mail->Port = '25';
		$mail->SMTPAuth = true;
		$mail->Username = 'contact@toserba.my.id';
		$mail->Password = 't053rba';
		//$mail->SMTPSecure = 'tls';
        $mail->WordWrap = 50;  
        // set email content
        $mail->setFrom('contact@toserba.my.id', 'Registrasi Toserba.my.id');
        $mail->addAddress('ryhorn@gmail.com');
        $mail->Subject = 'Test PHPMailer';
        $mail->Body = 'Email ini dikirim oleh PHPMailer';
        
        $mail->send();
	}
	function daftarbaru(){
        $nama=$this->input->post('nama',TRUE);
		$username=$this->input->post('username',TRUE);
		$email=$this->input->post('email',TRUE);
		$id=$this->input->post('id',TRUE);
		$url=$base_url()."/member/aktivasi/".$id;
		$body="Selamat Datang,<br>
				".$nama.",<br>
				Anda Sudah terdaftar di Toserba.my.id<br>
				User Anda : ".$username."<br>
				Silahkan klik <a href='".$url."'>link ini</a> untuk aktivasi<br>
				Atau Copy Paste URL di bawah ini :<br>
				".$url;
		
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
        //$mail->WordWrap = 50;  
        // set email content
        $mail->setFrom('contact@toserba.my.id', 'Registrasi Toserba.my.id');
        $mail->addAddress($email);
        $mail->Subject = "(Toserba.my.id) ".$nama.', Silahkan Aktivasi Email Anda';
        //$mail->Body = 'Email ini dikirim oleh PHPMailer';
		$mail->msgHTML($body);
        
        $mail->send();
	}
}