<!DOCTYPE html>
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->


<!-- Mirrored from optimisticdesigns.herokuapp.com/landerapp/pages-signin.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 01 Apr 2015 07:18:31 GMT -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Sign In - UET Peshawar</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

	<!-- Open Sans font from Google CDN -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&amp;subset=latin" rel="stylesheet" type="text/css">

	<!-- LanderApp's stylesheets -->
	<link href="<?=base_url();?>assets/stylesheets/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="<?=base_url();?>assets/stylesheets/landerapp.min.css" rel="stylesheet" type="text/css">
	<link href="<?=base_url();?>assets/stylesheets/pages.min.css" rel="stylesheet" type="text/css">
	<link href="<?=base_url();?>assets/stylesheets/rtl.min.css" rel="stylesheet" type="text/css">
	<link href="<?=base_url();?>assets/stylesheets/themes.min.css" rel="stylesheet" type="text/css">

	<!--[if lt IE 9]>
		<script src="assets/javascripts/ie.min.js"></script>
	<![endif]-->


<!-- $DEMO =========================================================================================

	Remove this section on production
-->
	<style>
		body{
			margin-top: 60px !important;
		}
		#signin-demo {
			position: fixed;
			right: 0;
			bottom: 0;
			z-index: 10000;
			background: rgba(0,0,0,.6);
			padding: 6px;
			border-radius: 3px;
		}
		#signin-demo img { cursor: pointer; height: 40px; }
		#signin-demo img:hover { opacity: .5; }
		#signin-demo div {
			color: #fff;
			font-size: 10px;
			font-weight: 600;
			padding-bottom: 6px;
		}
	</style>
<!-- / $DEMO -->

</head>


<!-- 1. $BODY ======================================================================================
	
	Body

	Classes:
	* 'theme-{THEME NAME}'
	* 'right-to-left'     - Sets text direction to right-to-left
-->
<body class="theme-default page-signin" >
<h1 align="center" style="color:#C90202;padding-top:40px; font-size:80px;"></h1>
<script>
	var init = [];
</script>
<!-- Demo script --> <script src="assets/demo/demo.js"></script> <!-- / Demo script -->

	<!-- Page background -->
	<div id="page-signin-bg">
		<!-- Background overlay -->
		<div class="overlay">
			<h1 align="center" style="color:#fff;padding-top:40px; font-size:80px; font-family: roboto light">ERP ORACLE PEOPLE-SOFT</h1>			
		</div>
		<!-- Replace this with your bg image -->
		<img src="<?=base_url('assets/demo/signin-bg-1.jpg');?>" alt="">

	</div>
	<!-- / Page background -->

	<!-- Container -->
	<div class="signin-container">

		<!-- Left side -->
		<div class="signin-info">
        	<h3 style="color:#FFF">Campus Soloution</h3>
			<!-- <a href="#" class="logo">
            	<img src="<?=base_url();?>assets/images/logo.png"  height="150px" width="150px"><br>
				UET <span style="font-weight:100;">Peshawar</span>
			</a> <!-- / .logo --> -->
			<div class="slogan">
				<ul>
				<li><i class="fa fa-sitemap signin-icon"></i>Business</li>
				<li><i class="fa fa-file-text-o signin-icon"></i> Process</li>
				<li><i class="fa fa-outdent signin-icon"></i> Re-Engineering</li>
				<li><i class="fa fa-file-text-o signin-icon"></i> (BRP)</li>
			</ul> 
			</div> <!-- / .slogan -->
			
		</div>
		<!-- / Left side -->

		<!-- Right side -->
		<div class="signin-form">
		<?=$this->session->flashdata('error_msg');?>
			<!-- Form -->
			<form action="<?=base_url();?>welcome/user_auth" id="signin-form_id" method = "post">
				<div class="signin-text">
					<span>Sign In to your account</span>
				</div> <!-- / .signin-text -->

				<div class="form-group w-icon">
                
					<input type="text" name="signin_username" id="username_id" class="form-control input-lg" placeholder="Username">
					<span class="fa fa-user signin-form-icon"></span>
				</div> <!-- / Username -->

				<div class="form-group w-icon">
					<input type="password" name="signin_password" id="password_id" class="form-control input-lg" placeholder="Password">
					<span class="fa fa-lock signin-form-icon"></span>
				</div> <!-- / Password -->

				<div class="form-actions">
					<input type="submit" value="SIGN IN" class="signin-btn bg-primary">
					
				</div> <!-- / .form-actions -->
			</form>
			<!-- / Form -->

			
			</div>
			<!-- / Password reset form -->
		</div>
		<!-- Right side -->
	</div>
	<!-- / Container -->

	

<!-- Get jQuery from Google CDN -->
<!--[if !IE]> -->
	<script type="text/javascript"> window.jQuery || document.write('<script src="<?=base_url();?>assets/javascripts/jquery.min.js">'+"<"+"/script>"); </script>
<!-- <![endif]-->
<!--[if lte IE 9]>
	<script type="text/javascript"> window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">'+"<"+"/script>"); </script>
<![endif]-->


<!-- LanderApp's javascripts -->
<script src="<?=base_url();?>assets/javascripts/bootstrap.min.js"></script>
<script src="<?=base_url();?>assets/javascripts/landerapp.min.js"></script>

<script type="text/javascript">
	// Resize BG
	init.push(function () {
		var $ph  = $('#page-signin-bg'),
		    $img = $ph.find('> img');

		$(window).on('resize', function () {
			$img.attr('style', '');
			if ($img.height() < $ph.height()) {
				$img.css({
					height: '100%',
					width: 'auto'
				});
			}
		});
	});

	// Show/Hide password reset form on click
	init.push(function () {
		$('#forgot-password-link').click(function () {
			$('#password-reset-form').fadeIn(400);
			return false;
		});
		$('#password-reset-form .close').click(function () {
			$('#password-reset-form').fadeOut(400);
			return false;
		});
	});

	// Setup Sign In form validation
	init.push(function () {
		$("#signin-form_id").validate({ focusInvalid: true, errorPlacement: function () {} });
		
		// Validate username
		$("#username_id").rules("add", {
			required: true,
			minlength: 3
		});

		// Validate password
		$("#password_id").rules("add", {
			required: true,
			minlength: 3
		});
	});

	// Setup Password Reset form validation
	init.push(function () {
		$("#password-reset-form_id").validate({ focusInvalid: true, errorPlacement: function () {} });
		
		// Validate email
		$("#p_email_id").rules("add", {
			required: true,
			email: true
		});
	});

	window.LanderApp.start(init);
</script>

</body>

<!-- Mirrored from optimisticdesigns.herokuapp.com/landerapp/pages-signin.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 01 Apr 2015 07:18:33 GMT -->
</html>
