<?php

require('connection.php');
require('functions.php');
require('add_to_cart.php');
$wishlist_count = 0;
$cat_res = mysqli_query($conn, "select * from categories where status=1 order by categories asc");
$cat_arr = array();
while ($row = mysqli_fetch_assoc($cat_res)) {
	$cat_arr[] = $row;
}

$obj = new add_to_cart();
$totalProduct = $obj->totalProduct();

if (isset($_SESSION['USER_LOGIN'])) {
	$uid = $_SESSION['USER_ID'];

	if (isset($_GET['wishlist_id'])) {
		$wid = get_safe_value($conn, $_GET['wishlist_id']);
		mysqli_query($conn, "delete from wishlist where id='$wid' and user_id='$uid'");
	}

	$wishlist_count = mysqli_num_rows(mysqli_query($conn, "select product.name,product.image,product.price,product.mrp,wishlist.id from product,wishlist where wishlist.product_id=product.id and wishlist.user_id='$uid'"));
}

$script_name = $_SERVER['SCRIPT_NAME'];
$script_name_arr = explode('/', $script_name);
$mypage = $script_name_arr[count($script_name_arr) - 1];

$meta_title = "Ecommerce";
$meta_desc = "Ecommerce";
$meta_keyword = "Ecommerce";
$meta_url = SITE_PATH;
$meta_image = "";
if ($mypage == 'product.php') {
	$product_id = get_safe_value($conn, $_GET['id']);
	$product_meta = mysqli_fetch_assoc(mysqli_query($conn, "select * from product where id='$product_id'"));
	$meta_title = $product_meta['meta_title'];
	$meta_desc = $product_meta['meta_desc'];
	$meta_keyword = $product_meta['meta_keyword'];
}
if ($mypage == 'contact.php') {
	$meta_title = 'Contact Us';
}

?>
<!doctype html>
<html class="no-js" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title><?php echo $meta_title ?></title>
	<meta name="description" content="<?php echo $meta_desc ?>">
	<meta name="keywords" content="<?php echo $meta_keyword ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta property="og:title" content="<?php echo $meta_title ?>" />
	<meta property="og:image" content="<?php echo $meta_image ?>" />
	<meta property="og:url" content="<?php echo $meta_url ?>" />
	<meta property="og:site_name" content="<?php echo SITE_PATH ?>" />

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/core.css">
	<link rel="stylesheet" href="css/shortcode/shortcodes.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="css/responsive.css">
	<link rel="stylesheet" href="css/custom.css">
	<!-- <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css" /> -->


	<style>
		.fv-btn {
			background: deepskyblue !important;
			border: 1px solid deepskyblue;

		}


		.fv-btn:hover {

			background: white !important;
			border: 1px solid deepskyblue;
			color: deepskyblue;
		}

		.main__menu li a {
			font-weight: bold;
		}

		.main__menu li:hover a {
			color: #57A6A1 !important;
		}

		.header__account a {
			font-weight: bold;
		}

		.header__account:hover a {
			color: deepskyblue;
		}

		.htc__shopping__cart a span.htc__wishlist {
			background: deepskyblue;
			border-radius: 100%;
			color: #fff;
			font-size: 9px;
			height: 17px;
			line-height: 19px;
			position: absolute;
			right: 17px;
			text-align: center;
			top: -4px;
			width: 17px;
		}
	</style>
</head>

<body>
	<!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->

	<!-- Body main wrapper start -->
	<div class="wrapper">
		<header id="htc__header" class="htc__header__area header--one">
			<div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header" style="background:#DAF5FF;">
				<div class="container">
					<div class="row">
						<div class="menumenu__container clearfix">
							<div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
								<div class="logo">
									<a href="index.php"><img src="images/logo/34.png" alt="logo images" style="width: 80%;"></a>
								</div>
							</div>
							<div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
								<nav class="main__menu__nav hidden-xs hidden-sm">
									<ul class="main__menu">
										<li class="drop"><a href="index.php">Home</a></li>
										<?php
										foreach ($cat_arr as $list) {
										?>
											<li class="drop"><a href="categories.php?id=<?php echo $list['id'] ?>"><?php echo $list['categories'] ?></a>
												<?php
												$cat_id = $list['id'];
												$sub_cat_res = mysqli_query($conn, "select * from sub_categories where status='1' and categories_id='$cat_id'");
												if (mysqli_num_rows($sub_cat_res) > 0) {
												?>

													<ul class="dropdown">
														<?php
														while ($sub_cat_rows = mysqli_fetch_assoc($sub_cat_res)) {
															echo '<li><a href="categories.php?id=' . $list['id'] . '&sub_categories=' . $sub_cat_rows['id'] . '">' . $sub_cat_rows['sub_categories'] . '</a></li>
													';
														}
														?>
													</ul>
												<?php } ?>
											</li>
										<?php
										}
										?>
										<li><a href="contact.php">contact-us</a></li>
									</ul>
								</nav>

								<div class="mobile-menu clearfix visible-xs visible-sm">
									<nav id="mobile_dropdown">
										<ul>
											<li><a href="index.php">Home</a></li>
											<?php
											foreach ($cat_arr as $list) {
											?>
												<li class="drop"><a href="categories.php?id=<?php echo $list['id'] ?>"><?php echo $list['categories'] ?></a>
													<?php
													$cat_id = $list['id'];
													$sub_cat_res = mysqli_query($conn, "select * from sub_categories where status='1' and categories_id='$cat_id'");
													if (mysqli_num_rows($sub_cat_res) > 0) {
													?>

														<ul class="dropdown">
															<?php
															while ($sub_cat_rows = mysqli_fetch_assoc($sub_cat_res)) {
																echo '<li><a href="categories.php?id=' . $list['id'] . '&sub_categories=' . $sub_cat_rows['id'] . '">' . $sub_cat_rows['sub_categories'] . '</a></li>
													';
															}
															?>
														</ul>
													<?php } ?>
												</li>
											<?php
											}
											?>
											<li><a href="contact.php">contact</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
								<div class="header__right" style="width:max-content;">
									<div class="header__right">
										<div class="header__search search search__open">
											<a href="#"><i class="icon-magnifier icons"></i></a>
										</div>
										<div class="header__account">
											<?php if (isset($_SESSION['USER_LOGIN'])) {
											?>
												<nav class="navbar navbar-expand-lg navbar-light bg-light">
													<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
														<span class="navbar-toggler-icon"></span>
													</button>

													<div class="collapse navbar-collapse" id="navbarSupportedContent">
														<ul>
															<li class="nav-item dropdown">
																<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	Account
																</a>
																<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="width:max-content;">
																	<a class="dropdown-item" href="my_order.php" style="margin-left:10px;">Orders</a>
																	<a class="dropdown-item" href="profile.php">Profile</a>
																	<div class="dropdown-divider"></div>
																	<a class="dropdown-item" href="logout.php" style="margin-left:10px;">Logout</a>
																</div>
															</li>

														</ul>
													</div>
												</nav>
											<?php
											} else {
												echo '<a href="login.php" class="mr15">Login/Register</a>';
											}
											?>

										</div>
										<div class="htc__shopping__cart">
											<?php
											if (isset($_SESSION['USER_ID'])) {
											?>

												<a href="wishlist.php"><i class="icon-heart icons"></i></a>
												<a href="wishlist.php"><span class="htc__wishlist"><?php echo $wishlist_count ?></span></a>
											<?php } ?>
											<a class="cart__menu" href="#"><i class="icon-handbag icons"></i></a>
											<a href="cart.php"><span class="htc__qua" style="background:deepskyblue;"><?php echo $totalProduct ?></span></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="mobile-menu-area"></div>
					</div>
				</div>
		</header>
		<div class="body__overlay"></div>
		<div class="offset__wrapper">
			<div class="search__area" style="background:powderblue;">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="search__inner">
								<form action="search.php" method="get">
									<input placeholder="Search here... " type="text" name="str">
									<button type="submit"></button>
								</form>
								<div class="search__close__btn">
									<span class="search__close__btn_icon"><i class="zmdi zmdi-close" style="color:lightseagreen!important; font-size:large;"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>