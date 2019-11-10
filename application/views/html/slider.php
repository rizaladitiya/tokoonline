
<style type="text/css">
.carousel-indicators {
    bottom:-40px;
	left:0;
	width:250px;
	background:#fff;
	padding: 6px 0px;
	margin-left:0;
	border-top:2px solid #fff;
}
.carousel-indicators li {
	width:12px;
	height:12px;	
	background:#ccc;
	border-color:#ccc;
 
}
.carousel-indicators .active {
	width:14px;
	height:14px;
	background:#428bca;
	border-color:#428bca;
}
.carousel-inner .thumbnail {
	margin-bottom:0;
	border-bottom-left-radius:0;
	border-bottom-right-radius:0;
	width:250px;
	height:250px;
}
.carousel-inner .caption {
	background:#fff;
	padding: 10px;
	width:250px;
}

 </style>
<script type="text/javascript">
(function(){
  $('#myCarousel').carousel({
    	interval:   4000
	});
}());

 </script>
 
 

            <div id="myCarousel" class="carousel slide">        
                <div class="carousel-inner">           
                    <div class="item active"> 
                    	<a href="#"><img class="thumbnail" src="http://placehold.it/600x400/" alt="Slide1"></a>
                        <div class="caption">
                       	  <h4>Lorem ipsum dolor sit amet, consetetur sadipscing elitr</h4>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>
                        </div>
                    </div>
                    <div class="item"> 
                    	<a href="#"><img class="thumbnail" src="http://placehold.it/600x400/" alt="Slide2"></a>
                        <div class="caption">
                       	  <h4>Lorem ipsum dolor sit amet, consetetur sadipscing elitr</h4>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>
                        </div>                                                           
                     </div>  
                    <div class="item"> 
                    	<a href="#"><img class="thumbnail" src="http://placehold.it/600x400/" alt="Slide3"></a>
                        <div class="caption">
                       	  <h4>Lorem ipsum dolor sit amet, consetetur sadipscing elitr</h4>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>
                        </div>                        
                    </div>                                                                                   
                </div>
                 <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>                                                                 
            </div><!-- End Carousel -->  
