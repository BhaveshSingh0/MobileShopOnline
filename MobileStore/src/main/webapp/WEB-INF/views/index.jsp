
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>MobileShoppe</title>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" charset="utf8"
	src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.js"></script>

<style>
.multi-item-carousel { .carousel-inner { > .item{ transition:500msease-in-outleft;
	
}

.active { &.left {s left:-33%;
	
}

&	
.right {
	left: 33%;
}

}
.next {
	left: 33%;
}

.prev {
	left: -33%;
}

@media all and (transform-3d) , ( -webkit-transform-3d ) { >
	.item { // use your favourite prefixer here transition:500msease-in-outleft;
		transition: 500ms ease-in-out all;
		backface-visibility: visible;
		transform: none !important;
	}
}

}
.carouse-control { &.left , &.right{ background-image:none;
	
}

}
}
body {
	background: #333;
	color: #ddd;
}

.carousel-inner>.item>img { //
	width: 1400px;
	height: 00px;
}
</style>
<script>
	//Instantiate the Bootstrap carousel
	$('.multi-item-carousel').carousel({
		interval : false
	});

	$('.multi-item-carousel .item').each(
			function() {
				var next = $(this).next();
				if (!next.length) {
					next = $(this).siblings(':first');
				}
				next.children(':first-child').clone().appendTo($(this));

				if (next.next().length > 0) {
					next.next().children(':first-child').clone().appendTo(
							$(this));
				} else {
					$(this).siblings(':first').children(':first-child').clone()
							.appendTo($(this));
				}
			});
</script>
</head>
<body style="background-color: white;">
	
			<%@ include file="header.jsp"%>
		
			
	<div class="container">
		<div class="row">

			<div class=" col-md-2 ">

				<%@ include file="category.jsp"%>
				
			</div>
			<div class="col-sm-offset-1 col-md-9">
				<div class="carousel slide multi-item-carousel" id="theCarousel">
					<div class="carousel-inner">
						<div class="item active">
							<div class="col-xs-4">
								<a href="mobile.jsp?tag=iphone"><img
									src="res/img/iphone.jpg" class="img-responsive"></a>
							</div>
							<div class="col-xs-4">
								<a href="mobile.jsp?tag=motorola"><img
									src="res/img/motorla.jpg" class="img-responsive"></a>
							</div>
							<div class="col-xs-4">
								<a href="mobile.jsp?tag=samsung"><img
									src="res/img/samsung.jpg" class="img-responsive"></a>
							</div>

						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="mobile.jsp?tag=lenevo"><img
									src="res/img/lenevo.jpg" class="img-responsive"></a>
							</div>
							<div class="col-xs-4">
								<a href="mobile.jsp?tag=vivo"><img src="res/img/vivo.jpg"
									class="img-responsive"></a>
							</div>
							<div class="col-xs-4">
								<a href="mobile.jsp?tag=mi"><img src="res/img//mi.jpg"
									class="img-responsive"></a>
							</div>

						</div>

					</div>
					<a class="left carousel-control" href="#theCarousel"
						data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
					<a class="right carousel-control" href="#theCarousel"
						data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</div>
		</div>

	</div>
	<br>





	<br>

	<div class="row">
		<%@ include file="footer.jsp"%>
	</div>


</body>



</html>
