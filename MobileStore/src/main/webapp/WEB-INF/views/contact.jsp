<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact</title>

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

.social-btn-holder{
  padding:10px;
  margin-top:5px;
  margin-bottom:5px;
}
.social-btn-holder .btn-social{
  font-size:12px;
  font-weight:bold;
}

.btn-social{
  color: white;
  opacity:0.9;
}
.btn-social:hover {
  color: white;
  opacity:1;
}
.btn-facebook {
background-color: #3b5998;
}
.btn-twitter {
background-color: #00aced;
}
.btn-linkedin {
background-color:#0e76a8;
}
.btn-github{
  background-color:#000000;
}
.btn-google {
  background-color: #c32f10;
}
.btn-stackoverflow{
  background-color: #D38B28;
}

.btn-hackerrank{
  background-color: #27AB5B;
}
.btn-soundcloud{
  background-color: #FF7202;
}



.centered-text{
  text-align: center;
}

</style>
</head>
<body>

                        <center>
	<%@ include file="header.jsp"%>
	

<div class="container">

<br>
        <img class="img-circle img-responsive"  style="width: 250px;  height: 300px; border-radius: 200px 200px 200px 200px ;" src="https://pbs.twimg.com/profile_images/762253488168562688/6OuRDvoK_400x400.jpg">
                              
                       
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="centered-text col-sm-offset-3 col-sm-6 col-md-offset-3 col-md-6 col-lg-offset-3 col-lg-6">
                                    <div itemscope="" itemtype="http://schema.org/Person">
                                        <h2> <span itemprop="name">Bhavesh Singh</span></h2>
                                        <p itemprop="jobTitle">Java Developer</p>
                                        
                                        <p>
                                            <i class="fa fa-map-marker"></i> <span itemprop="addressRegion">Navi Mumbai</span>
                                        </p>
                                        <p itemprop="email"> <i class="fa fa-envelope"> </i> <a href="mailto:you@somedomain.com">bhaveshsingh322@gmail.com</a> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div id="social-links" class=" col-sm-offset-2 col-lg-12">
                            <div class="row">
                                <div class="col-xs-6 col-sm-3 col-md-2 col-lg-3 social-btn-holder">
                                    <a title="google" class="btn btn-social btn-block btn-google" target="_BLANK" href="http://plus.google.com/+You/">
                                        <i class="fa fa-google"></i>Google+
                                    </a>
                                </div>
                                <div class="col-xs-6 col-sm-3 col-md-2 col-lg-3 social-btn-holder">
                                    <a title="twitter" class="btn btn-social btn-block btn-twitter" target="_BLANK" href="http://twitter.com/bhaveshsingh0">
                                        <i class="fa fa-twitter"></i>Twitter
                                    </a>
                                </div>
                                <div class="col-xs-6 col-sm-3 col-md-2 col-lg-3 social-btn-holder">
                                    <a title="github" class="btn btn-social btn-block btn-github" target="_BLANK" href="http://github.com/bhaveshsingh0">
                                        <i class="fa fa-github"></i>Github
                                    </a>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    
                       
                </div>
          
    </center>
</body>
</html>