<?php
require('top.php');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
?>
    <script>
        window.location.href = 'index.php';
    </script>
    <?php
}

$cart_total = 0;
if (isset($_POST['submit'])) {

    $address = get_safe_value($conn, $_POST['address']);
    $city = get_safe_value($conn, $_POST['city']);
    $pincode = get_safe_value($conn, $_POST['pincode']);
    $payment_type = get_safe_value($conn, $_POST['payment_type']);
    $user_id = $_SESSION['USER_ID'];
    foreach ($_SESSION['cart'] as $key => $val) {
        $productArr = get_product($conn, '', '', $key);
        $price = $productArr[0]['price'];
        $qty = $val['qty'];
        $cart_total = $cart_total + ($price * $qty);
    }
    $total_price = $cart_total;
    $payment_status = 'pending';
    if ($payment_type == 'cod') {
        $payment_status = 'success';
        $payment_id = '';
    }

    $order_status = '1';
    $added_on = date('Y-m-d h:i:s');
    if (isset($_SESSION['COUPON_ID'])) {

        $coupon_id = $_SESSION['COUPON_ID'];

        $coupon_code = $_SESSION['COUPON_CODE'];
        $coupon_value = $_SESSION['COUPON_VALUE'];
        $total_price = $total_price - $coupon_value;
        unset($_SESSION['COUPON_ID']);
        unset($_SESSION['COUPON_CODE']);
        unset($_SESSION['COUPON_VALUE']);
    } else {
        $coupon_id = '';
        $coupon_code = '';
        $coupon_value = '';
    }


    mysqli_query($conn, "insert into `order`(user_id,address,city,pincode,payment_type,payment_status,order_status,added_on,total_price,coupon_id,coupon_code,coupon_value,payment_id) values('$user_id','$address','$city','$pincode','$payment_type','$payment_status','$order_status','$added_on','$total_price','$coupon_id','$coupon_code','$coupon_value','$payment_id')");


    $order_id = mysqli_insert_id($conn);

    foreach ($_SESSION['cart'] as $key => $val) {
        $productArr = get_product($conn, '', '', $key);
        $price = $productArr[0]['price'];
        $qty = $val['qty'];

        mysqli_query($conn, "insert into `order_detail`(order_id,product_id,qty,price) values('$order_id','$key','$qty','$price')");
    }

    if ($payment_type == 'stripe') {
        // Create a Stripe Checkout session
        require_once('./vendor/autoload.php'); // Include Stripe PHP library

        \Stripe\Stripe::setApiKey('sk_test_51POFyg06j16NHU6CwS37vjA1L3zKHRQeXUDMJNjazpJUKItB8OP0KfBW3YaMmkoZLZJ6gyvL0YpBR1NtHV2zMNUR00xlWiehGb'); // Replace with your Stripe secret key

        $checkout_session = \Stripe\Checkout\Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'inr', // Change to your preferred currency
                    'product_data' => [
                        'name' => 'Order #' . $order_id,
                    ],
                    'unit_amount' => $total_price * 100, // Stripe requires amount in cents
                ],
                'quantity' => $qty,
            ]],
            'mode' => 'payment',
            'success_url' => 'http://127.0.0.1/Ecommerce/payment_complete.php?session_id={CHECKOUT_SESSION_ID}', // Replace with your success URL
            'cancel_url' => 'http://127.0.0.1/Ecommerce/payment_fail.php', // Replace with your cancel URL
            'metadata' => [
                'order_id' => $order_id,

            ],
        ]);

        $_SESSION['STRIPE_CHECKOUT_SESSION_ID'] = $checkout_session->id;

    ?>
        <script src="https://js.stripe.com/v3/"></script>
        <script>
            if (typeof Stripe !== 'undefined') {
                var stripe = Stripe('pk_test_51POFyg06j16NHU6CLBM5Z5oA1x763L2wfmYe3CFTVKPuCePbaQO1UxZqnwsT4HauQZRQ8eTTfbLigKu19fc9DP1Z00EOO4hvRh'); // Replace with your Stripe publishable key
                stripe.redirectToCheckout({
                    sessionId: '<?php echo $checkout_session->id; ?>'
                }).then(function(result) {
                    if (result.error) {
                        alert(result.error.message);
                    }
                });
            } else {
                console.error('Stripe.js not loaded');
            }
        </script>
    <?php
    } else {
        unset($_SESSION['cart']);
    ?>
        <script>
            window.location.href = 'thank_you.php';
        </script>
<?php
    }
}


?>

<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.jpg) no-repeat scroll center center / cover ;">
    <div class="ht__bradcaump__wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="bradcaump__inner">
                        <nav class="bradcaump-inner">
                            <a class="breadcrumb-item" href="index.php">Home</a>
                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                            <span class="breadcrumb-item active">checkout</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Bradcaump area -->
<!-- cart-main-area start -->
<div class="checkout-wrap ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="checkout__inner">
                    <div class="accordion-list">
                        <div class="accordion">

                            <?php
                            $accordion_class = 'accordion__title';
                            if (!isset($_SESSION['USER_LOGIN'])) {
                                $accordion_class = 'accordion__hide';
                            ?>
                                <div class="accordion__title">
                                    Checkout Method
                                </div>
                                <div class="accordion__body">
                                    <div class="accordion__body__form">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="checkout-method__login">
                                                    <form id="login-form" method="post">
                                                        <h5 class="checkout-method__title">Login</h5>
                                                        <div class="single-input">
                                                            <input type="text" name="login_email" id="login_email" placeholder="Your Email*" style="width:100%">
                                                            <span class="field_error" id="login_email_error"></span>
                                                        </div>

                                                        <div class="single-input">
                                                            <input type="password" name="login_password" id="login_password" placeholder="Your Password*" style="width:100%">
                                                            <span class="field_error" id="login_password_error"></span>
                                                        </div>

                                                        <p class="require">* Required fields</p>
                                                        <div class="dark-btn">
                                                            <button type="button" class="fv-btn" onclick="user_login()">Login</button>
                                                        </div>
                                                        <div class="form-output login_msg">
                                                            <p class="form-messege field_error"></p>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="checkout-method__login">
                                                    <form action="#">
                                                        <h5 class="checkout-method__title">Register</h5>
                                                        <div class="single-input">
                                                            <input type="text" name="name" id="name" placeholder="Your Name*" style="width:100%">
                                                            <span class="field_error" id="name_error"></span>
                                                        </div>
                                                        <div class="single-input">
                                                            <input type="text" name="email" id="email" placeholder="Your Email*" style="width:100%">
                                                            <span class="field_error" id="email_error"></span>
                                                        </div>

                                                        <div class="single-input">
                                                            <input type="text" name="mobile" id="mobile" placeholder="Your Mobile*" style="width:100%">
                                                            <span class="field_error" id="mobile_error"></span>
                                                        </div>
                                                        <div class="single-input">
                                                            <input type="password" name="password" id="password" placeholder="Your Password*" style="width:100%">
                                                            <span class="field_error" id="password_error"></span>
                                                        </div>
                                                        <div class="dark-btn">
                                                            <button type="button" class="fv-btn" onclick="user_register()">Register</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            <div class="<?php echo $accordion_class ?>">
                                Address Information
                            </div>
                            <form method="post">
                                <div class="accordion__body">
                                    <div class="bilinfo">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="single-input">
                                                    <input type="text" name="address" placeholder="Street Address" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-input">
                                                    <input type="text" name="city" placeholder="City/State" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-input">
                                                    <input type="text" name="pincode" placeholder="Post code/ zip" required>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="<?php echo $accordion_class ?>">
                                    payment information
                                </div>
                                <div class="accordion__body">
                                    <div class="paymentinfo">
                                        <div class="single-method">
                                            COD <input type="radio" name="payment_type" value="COD" required />
                                            &nbsp;&nbsp;Stripe <input type="radio" name="payment_type" value="stripe" required />
                                        </div>
                                        <div class="single-method">

                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="submit" style="width: 10rem;height: 3rem;outline: none;border: none;border-radius: 50px;font-weight:bold;font-size:18px;background:aliceblue;color:lightseagreen;">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="order-details">
                    <h5 class="order-details__title" style="font-weight:bolder;">Your Order</h5>
                    <div class="order-details__item">
                        <?php
                        $cart_total = 0;
                        foreach ($_SESSION['cart'] as $key => $val) {
                            $productArr = get_product($conn, '', '', $key);
                            $pname = $productArr[0]['name'];
                            $mrp = $productArr[0]['mrp'];
                            $price = $productArr[0]['price'];
                            $image = $productArr[0]['image'];
                            $qty = $val['qty'];
                            $cart_total = $cart_total + ($price * $qty);
                        ?>
                            <div class="single-item">
                                <div class="single-item__thumb">
                                    <img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $image ?>" />
                                </div>
                                <div class="single-item__content">
                                    <a href="#"><?php echo $pname ?></a>
                                    <span class="price"><?php echo "&#x20B9;" . $price * $qty ?></span>
                                </div>
                                <div class="single-item__remove">
                                    <a href="javascript:void(0)" onclick="manage_cart('<?php echo $key ?>','remove')"><i class="icon-trash icons"></i></a>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="ordre-details__total" id="coupon_box">
                        <h5>Coupon Value</h5>
                        <span class="price" id="coupon_price"></span>
                    </div>
                    <div class="ordre-details__total">
                        <h5>Order total</h5>
                        <span class="price" id="order_total_price"><?php echo '₹' . $cart_total ?></span>
                    </div>

                    <div class="ordre-details__total bilinfo">
                        <input type="textbox" id="coupon_str" class="coupon_style mr5" /> <input type="button" name="submit" class="fv-btn coupon_style" value="Apply Coupon" onclick="set_coupon()" />

                    </div>
                    <div id="coupon_result"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script>
    function set_coupon() {
        var coupon_str = jQuery('#coupon_str').val();
        if (coupon_str != '') {
            jQuery('#coupon_result').html('');
            jQuery.ajax({
                url: 'set_coupon.php',
                type: 'post',
                data: 'coupon_str=' + coupon_str,
                success: function(result) {
                    var data = jQuery.parseJSON(result);
                    if (data.is_error == 'yes') {
                        jQuery('#coupon_box').hide();
                        jQuery('#coupon_result').html('₹' + data.dd);
                        jQuery('#order_total_price').html('₹' + data.result);
                    }
                    if (data.is_error == 'no') {
                        jQuery('#coupon_box').show();
                        jQuery('#coupon_price').html('₹' + data.dd);
                        jQuery('#order_total_price').html('₹' + data.result);
                    }
                }
            });
        }
    }
</script>
<?php
if (isset($_SESSION['COUPON_ID'])) {
    unset($_SESSION['COUPON_ID']);
    unset($_SESSION['COUPON_CODE']);
    unset($_SESSION['COUPON_VALUE']);
}
require('footer.php');
?>