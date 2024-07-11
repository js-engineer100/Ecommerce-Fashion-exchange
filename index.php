<?php require ('top.php');
$resBanner = mysqli_query($conn, "select * from banner where status='1' order by order_no asc");
?>
<div class="body__overlay"></div>
<?php if (mysqli_num_rows($resBanner) > 0) { ?>

	<!-- Start Slider Area -->
	<div class="slider__container slider--one bg__cat--3" style="background:powderblue;">
		<div class="slide__container slider__activation__wrap owl-carousel">
			<?php while ($rowBanner = mysqli_fetch_assoc($resBanner)) { ?>
				<!-- Start Single Slide -->
				<div class="single__slide animation__style01 slider__fixed--height">
					<div class="container">
						<div class="row align-items__center">
							<div class="col-md-7 col-sm-7 col-xs-12 col-lg-6" style="margin-right:80px;">
								<div class="slide">
									<div class="slider__inner">

										<h2 style="margin-left:10px;"><?php echo $rowBanner['heading1'] ?></h2>
										<h1><?php echo $rowBanner['heading2'] ?></h1>

										<?php
										if ($rowBanner['btn_txt'] != '' && $rowBanner['btn_link'] != '') {
											?>
											<div class="cr__btn">
												<a
													href="<?php echo $rowBanner['btn_link'] ?>"><?php echo $rowBanner['btn_txt'] ?></a>
											</div>
											<?php
										}
										?>

									</div>
								</div>
							</div>
							<div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
								<div class="slide__thumb" style="max-width:480px;">
									<img src="<?php echo BANNER_SITE_PATH . $rowBanner['image'] ?>">

								</div>
							</div>
						</div>
					</div>
				</div>
			<?php } ?>



		</div>
	</div>
	<!-- Start Slider Area -->
<?php } ?>
<!-- Start Slider Area -->
<!-- Start Category Area -->
<section class="htc__category__area ptb--100">
	<div class="new-arrivals-container" style="background:#DAF5FF;">
		<div class="new-arrivals-strip" id="newArrivalsStrip">
			<div class="new-arrivals-content">
				<!-- <h2 class="title__line">New Arrivals</h2> -->
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="section__title--2 text-center">



				</div>
			</div>
		</div>
		<div class="htc__product__container">
			<div class="row">
				<div class="product__list clearfix mt--30">
					<?php
					$get_product = get_product($conn, 8);
					foreach ($get_product as $list) {
						?>
						<!-- Start Single Category -->
						<div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
							<div class="category">
								<div class="ht__cat__thumb">
									<a href="product.php?id=<?php echo $list['id'] ?>">
										<img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $list['image'] ?>"
											alt="product images">
									</a>
								</div>
								<div class="fr__hover__info">
									<ul class="product__action">
										<li><a href="javascript:void(0)"
												onclick="wishlist_manage('<?php echo $list['id'] ?>','add')"><i
													class="icon-heart icons"></i></a></li>
										<li><a href="javascript:void(0)"
												onclick="manage_cart('<?php echo $list['id'] ?>','add')"><i
													class="icon-handbag icons"></i></a></li>
									</ul>
								</div>
								<div class="fr__product__inner">
									<h4><a href="product.php?id=<?php echo $list['id'] ?>"><?php echo $list['name'] ?></a>
									</h4>
									<ul class="fr__pro__prize">
										<li class="old__prize" style="text-decoration:line-through; font-weight:bold;">
											<?php echo "&#x20B9;" . $list['mrp'] ?>
										</li>
										<li><?php echo "&#x20B9;" . $list['price'] ?></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- End Single Category -->
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Category Area -->
<!-- Start Product Area -->
<section class="ftr__product__area ptb--100">
	<div class="best-seller-strip">
		<!-- The "Best Seller" titles will be added dynamically here -->
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="section__title--2 text-center">

				</div>
			</div>
		</div>
		<div class="row">
			<div class="product__list clearfix mt--30">
				<?php
				$get_product = get_product($conn, 4, '', '', '', '', 'yes');
				foreach ($get_product as $list) {
					?>
					<!-- Start Single Category -->
					<div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
						<div class="category">
							<div class="ht__cat__thumb">
								<a href="product.php?id=<?php echo $list['id'] ?>">
									<img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $list['image'] ?>" alt="product images">
								</a>
							</div>
							<div class="fr__hover__info">
								<ul class="product__action">
									<li><a href="javascript:void(0)"
											onclick="wishlist_manage('<?php echo $list['id'] ?>','add')"><i
												class="icon-heart icons"></i></a></li>
									<li><a href="javascript:void(0)"
											onclick="manage_cart('<?php echo $list['id'] ?>','add')"><i
												class="icon-handbag icons"></i></a></li>
								</ul>
							</div>

							<div class="fr__product__inner">
								<h4><a href="product.php?id=<?php echo $list['id'] ?>"><?php echo $list['name'] ?></a></h4>
								<ul class="fr__pro__prize">
									<li class="old__prize" style="text-decoration:line-through; font-weight:bold;">
										<?php echo '&#x20B9;' . $list['mrp'] ?>
									</li>
									<li><?php echo '&#x20B9;' . $list['price'] ?></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Category -->
				<?php } ?>
			</div>


		</div>
	</div>
</section>
<input type="hidden" id="qty" value="1" />
<script>
	// Sample new arrivals data
	const newArrivalsData = [
		"New Arrivals",
		"New Arrivals",
		"New Arrivals",
		"New Arrivals",
		"New Arrivals",
		// Add more items as needed
	];

	// Function to add new arrivals content dynamically
	function addNewArrivals() {
		const newArrivalsStrip = document.getElementById("newArrivalsStrip");
		let index = 0; // Start index
		setInterval(() => {
			const newItem = document.createElement("div");
			newItem.classList.add("new-arrivals-content");
			newItem.textContent = newArrivalsData[index % newArrivalsData.length]; // Cycle through the data
			newArrivalsStrip.appendChild(newItem);
			index++; // Increment index for next iteration
		}, 100); // Adjust the interval as needed (milliseconds)
	}

	// Call the function to add new arrivals content
	addNewArrivals();

	document.addEventListener('DOMContentLoaded', function () {
		const bestSellerStrip = document.querySelector('.best-seller-strip');

		function addBestSellerTitle(title) {
			const titleElement = document.createElement('h2');
			titleElement.textContent = title;
			titleElement.classList.add('best-seller-title');
			bestSellerStrip.appendChild(titleElement);
		}

		const bestSellerTitles = ['Best Seller', 'Best Seller', 'Best Seller', 'Best Seller', 'Best Seller', 'Best Seller', 'Best Seller', 'Best Seller'];
		bestSellerTitles.forEach(addBestSellerTitle);
	});
</script>







<!-- End Product Area -->
<?php require ('footer.php') ?>