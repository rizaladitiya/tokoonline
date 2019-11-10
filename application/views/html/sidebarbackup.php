<div class="col-lg-3 col-md-3 col-sm-12 hidden-print">



<!-- Categories -->
<div class="col-lg-12 col-md-12 col-sm-6">

	<div class="no-padding">
    		<span class="title">Jasa</span>
    	</div>

		<div id="main_menu_jasa">
            <div class="list-group panel panel-cat">
				<a href="produk/orderojek" class="list-group-item" >Ojek Online</a>                  
            </div>
        </div>

	<div class="no-padding">
    		<span class="title">Produk</span>
    	</div>

		<div id="main_menu">
            <div class="list-group panel panel-cat">
            	<?php
            	$dKat=produk_kategori();
            	if(!empty($dKat))
            	{
					foreach($dKat as $rKat)
					{
						$slugCat=string_create_slug($rKat->nama_kategori);
						$urlcat=base_url().'produk/kategori/'.$rKat->kategori_id.'/'.$slugCat;
					?>
					<a href="<?=$urlcat;?>" class="list-group-item" ><?=$rKat->nama_kategori;?></a>
					<?php
					}
				}
            	?>                            
            </div>
        </div>

	</div>
	<!-- End Categories -->



	<!-- Best Seller -->
	<div class="col-lg-12 col-md-12 col-sm-6">
		<div class="no-padding">
    		<span class="title">Terlaris</span>
    	</div>
	<!-- End Best Seller -->
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">  	
	<?php
    	$dBest=produk_best_seller(2);
    	if(!empty($dBest))
    	{
    		$iBest=0;
			foreach($dBest as $rBest)
			{
				$iBest+=1;
				$cBestFeat='';
				if($iBest==1)
				{
					$cBestFeat="hidden-sm";
				}							
				$photoBest=produk_photo($rBest->produk_id,1);
				if(empty($photoBest))
				{
					$urlPhotoBest=base_url().'assets/images/avatar/noavatar.jpg';
				}else{
					
				
					foreach($photoBest as $rPhotoBest)
					{								
					}
					$urlPhotoBest=base_url().'assets/images/produk/thumbs/400/'.$rPhotoBest->photo;
					$pathPhotoBest=FCPATH.'assets/images/produk/thumbs/400/'.$rPhotoBest->photo;					
					if(!file_exists($pathPhotoBest) && !file_exists($pathPhotoBest))
					{
						$urlPhotoBest=base_url().'assets/images/avatar/noavatar.jpg';
					}
				}
				$slugBest=string_create_slug($rBest->nama_produk);
				$urlProdukBest=base_url().'produk/'.$rBest->produk_id.'/'.$slugBest;
			?>
			               
                    <div class="item <?php if($iBest==1){echo "active";}?>"> 
                    	<a href="<?=$urlProdukBest;?>"><img class="thumbnail" src="<?=$urlPhotoBest;?>" alt="<?=$rBest->nama_produk;?>"></a>
                        <div class="caption">
                       	  <h4><a href="<?=$urlProdukBest;?>"><?=$rBest->nama_produk;?></a></h4>
                            <p>
							<div class="btn-group">
	                        	<a href="javascript:;" class="btn btn-default">Rp <?=number_format($rBest->harga,0);?></a>
	                        	<a href="<?=base_url();?>produk/add/<?=$rBest->produk_id;?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Beli</a>
                        	</div>
							</p>
                        </div>
                    </div>                                                                              
                
                 
	
			<?php
			}
			
    	?>
		</div>
				<!-- Indicators -->
                  <ol class="carousel-indicators">
		<?php
		$iLi=0;
			foreach($dBest as $rBest)
			{
		?>
                    <li data-target="#myCarousel" data-slide-to="<?php echo $iLi;?>" <?php if($iLi==0){echo "class=\"active\"";}?>></li>
                  
			
		<?php
			$iLi+=1;
			}
		}
		?>
				</ol>        
		</div>
				<!-- End Carousel --> 
	</div>
</div>