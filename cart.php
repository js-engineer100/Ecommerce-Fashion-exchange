<?php
require ('top.php');
// unset($_SESSION['cart']);
?>

<div class="ht__bradcaump__area"
    style="background: rgba(0, 0, 0, 0) url(images/bg/14.jpg) no-repeat scroll center center / cover ;">
    <div class="ht__bradcaump__wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="bradcaump__inner">
                        <nav class="bradcaump-inner">
                            <a class="breadcrumb-item" href="index.php">Home</a>
                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                            <span class="breadcrumb-item active">shopping cart</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Bradcaump area -->
<!-- cart-main-area start -->
<div class="cart-main-area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <form action="#">
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">products</th>
                                    <th class="product-name">name of products</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (isset($_SESSION['cart'])) {
                                    foreach ($_SESSION['cart'] as $key => $val) {
                                        $productArr = get_product($conn, '', '', $key);
                                        $pname = $productArr[0]['name'];
                                        $mrp = $productArr[0]['mrp'];
                                        $price = $productArr[0]['price'];
                                        $image = $productArr[0]['image'];
                                        $qty = $val['qty'];
                                        ?>
                                        <tr>
                                            <td class="product-thumbnail"><a href="#"><img
                                                        src="<?php echo PRODUCT_IMAGE_SITE_PATH . $image ?>" /></a></td>
                                            <td class="product-name"><a href="#"><?php echo $pname ?></a>
                                                <ul class="pro__prize">
                                                    <li class="old__prize" style="text-decoration:line-through;">
                                                        <?php echo "&#x20B9;" . $mrp ?>
                                                    </li>
                                                    <li><?php echo "&#x20B9;" . $price ?></li>
                                                </ul>
                                            </td>
                                            <td class="product-price"><span
                                                    class="amount"><?php echo "&#x20B9;" . $price ?></span></td>
                                            <td class="product-quantity"><input type="number" id="<?php echo $key ?>qty"
                                                    value="<?php echo $qty ?>" onchange="validateQuantity(this)" />


                                                <br />
                                                <span id="quantityMessage" style="color:red;"></span><br />
                                                <a href="javascript:void(0)"
                                                    onclick="manage_cart('<?php echo $key ?>','update')"
                                                    style="font-size: medium; color: deepskyblue ;font-weight:bold;">update</a>
                                            </td>
                                            <td class="product-subtotal"><?php echo "&#x20B9;" . $qty * $price ?></td>
                                            <td class="product-remove"><a href="javascript:void(0)"
                                                    onclick="manage_cart('<?php echo $key ?>','remove')"><i
                                                        class="icon-trash icons"></i></a></td>
                                        </tr>
                                    <?php }
                                } ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="buttons-cart--inner">
                                <div class="buttons-cart">
                                    <a href="<?php echo SITE_PATH ?>" style="font-weight:bold;">Continue Shopping</a>
                                </div>
                                <div class="buttons-cart checkout--btn">
                                    <a href="<?php echo SITE_PATH ?>checkout.php" style="font-weight:bold;">checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function validateQuantity(input) {
        let quantity = parseInt(input.value);
        let messageSpan = document.getElementById('quantityMessage');

        if (quantity <= 0) {
            input.value = 1;  // Set input value to 1 if zero or negative
            messageSpan.textContent = 'Quantity cannot be zero';
        } else {
            messageSpan.textContent = '';  // Clear message if quantity is valid
        }
    }
</script>

<?php require ('footer.php') ?>