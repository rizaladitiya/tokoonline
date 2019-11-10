<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><?=$judul;?></title>
	<link rel="shortcut icon" href="<?=base_url()."assets/images/".baca_konfig('tema-logo');?>" type="image/x-icon" />    <!-- Favicon -->
    <link href="<?=base_url();?>assets/html/css/bootstrap.css" rel="stylesheet">
    <link href="<?=base_url();?>assets/html/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?=base_url();?>assets/html/css/jquery.bxslider.css" rel="stylesheet">
    <link href="<?=base_url();?>assets/html/css/style.css" rel="stylesheet">
    <link href="<?=base_url();?>assets/style.css" rel="stylesheet">
    <script src="<?=base_url();?>assets/html/js/jquery.js"></script>
    <script src="<?=base_url();?>assets/custom.js"></script>
    <?php
    echo add_css(base_url().'assets/plugin/prettyphoto/css/prettyPhoto.css');
    echo add_js(base_url().'assets/plugin/prettyphoto/js/jquery.prettyPhoto.js');
    ?>
	
    <script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
	    $("a[rel^='prettyPhoto']").prettyPhoto({
	    	default_width: 500,
			default_height: 344,
			sosial_tools:"",
	    });		
		$('#myCarousel').carousel({
    	interval:   4000
		});
	});
	</script>
	<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-90183913-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PDN7WK8');</script>
<!-- End Google Tag Manager -->
</head>
<body style="background-image:url('http://toserba.my.id/assets/images/bodylogo.jpg');">

	<header class="hidden-print" style="background-image:url('<?=base_url();?>assets/images/bglogo.jpg');background-repeat: repeat-x;">
	    <div class="container">
	        <div class="row">

	        	<!-- Logo -->
	            <div class="col-lg-4 col-md-3 hidden-sm hidden-xs">
	            	<div class="well logo">
	            		<a href="<?=base_url();?>">
							<img src="<?=base_url()."assets/images/".baca_konfig('tema-logo');?>" width="50px" height="50px">
	            			<?=baca_konfig('nama-aplikasi');?> <span><?=baca_konfig('company-name');?></span>
	            		</a>	            		
	            	</div>
	            </div>
	            <!-- End Logo -->

				<!-- Search Form -->
	            <div class="col-lg-5 col-md-5 col-sm-7 col-xs-12">
	            	<div class="well">
	                    <form action="<?=base_url();?>produk/cari" method="get">
	                        <div class="input-group">
	                            <input type="text" name="cari" class="form-control input-search" placeholder="Cari produk apapun"/>
	                            <span class="input-group-btn">
	                                <button class="btn btn-default no-border-left" type="submit"><i class="fa fa-search"></i></button>
	                            </span>
	                        </div>
	                    </form>
	                </div>
	            </div>
	            <!-- End Search Form -->

	            <!-- Shopping Cart List -->
	            <div class="col-lg-3 col-md-4 col-sm-5">
	                <div class="well">
	                    <div class="btn-group btn-group-cart">
	                    <?php
	                    if(akses()=="member")
	                    {
						?>
						<div class="btn-group">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						    Akun Saya <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a href="<?=base_url();?>akun">Profil</a></li>
						    <li><a href="<?=base_url();?>akun/histori">Histori Belanja</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="<?=base_url();?>logout">Log Out</a></li>
						  </ul>
						</div>
						<?php
						}else{
							$ref=$this->uri->ruri_string();
						?>
						<a href="<?=base_url();?>member/login?ref=<?=$ref;?>">Login</a> | 
						<a href="<?=base_url();?>member/daftar?ref=<?=$ref;?>">Daftar</a>
						<?php
						}
	                    ?>						
	                    </div>
	                </div>
	            </div>
	            <!-- End Shopping Cart List -->
	        </div>
	    </div>
    </header>

	<!-- Navigation -->
    <nav class="navbar navbar-inverse hidden-print" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- text logo on mobile view -->
                <a class="navbar-brand visible-xs" href="<?=base_url();?>"><?=baca_konfig('company-name');?></a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">                	
                    <li><a href="<?=base_url();?>" class="<?=menu_html('produk');?>">Home</a></li>
                    <li><a href="<?=base_url();?>promo" class="<?=menu_html('promo');?>">Promo</a></li>
                    <li><a href="<?=base_url();?>keranjang" class="<?=menu_html('keranjang');?>">Keranjang</a></li>
                    <li><a href="<?=base_url();?>konfirmasi" class="<?=menu_html('konfirmasi');?>">Konfirmasi Pembayaran</a></li>
                    <li><a href="<?=base_url();?>tracking" class="<?=menu_html('tracking');?>">Tracking Order</a></li>
                    <li class="nav-dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Informasi <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<?php
							$dHalaman=$this->m_db->get_data('berita',array('jenis'=>'halaman'));
							if(!empty($dHalaman))
							{
								foreach($dHalaman as $rHalaman)
								{
									$urlpage=base_url().'informasi/'.$rHalaman->slug;
								?>
								<li><a href="<?=$urlpage;?>"><?=$rHalaman->judul;?></a></li>
								<?php
								}
							}
							?>                            
                        </ul>
                    </li>
                </ul>				
            </div>
        </div>
    </nav>
    <!-- End Navigation -->

    <div class="container main-container">
        

        <div class="row">
        	<?php
        	$this->load->view('html/sidebar');
        	?>

        	<div class="clearfix visible-sm"></div>

			<!-- Featured -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12 hidden-print">
            		<span class="title"><?=$judulhalaman;?></span>
            	</div>
            	
        	