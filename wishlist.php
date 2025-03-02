<?php
require('top.php');
if (!isset($_SESSION['USER_LOGIN'])) {
?>
    <script>
        window.location.href = 'index.php';
    </script>
<?php
}

$uid = $_SESSION['USER_ID'];

$res = mysqli_query($conn, "select product.name,product.id as pid,product.image,product.price,product.mrp,wishlist.id from product,wishlist where wishlist.product_id=product.id and wishlist.user_id='$uid'");
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
                            <span class="breadcrumb-item active">Wishlist</span>
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
                            <thead style="background:aliceblue;">
                                <tr>
                                    <th class="product-thumbnail">Product Image</th>
                                    <th class="product-name">Product Name</th>
                                    <th class="product-action" style="width:20px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (mysqli_num_rows($res) > 0) {
                                    while ($row = mysqli_fetch_assoc($res)) {

                                ?>
                                        <tr>
                                            <td class="product-thumbnail">
                                                <a href="#"><img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $row['image']; ?>" style="height:200px;width:200px;" /></a>
                                            </td>
                                            <td class="product-name">
                                                <a href="#"><?php echo $row['name']; ?></a>
                                                <ul class="pro__prize">
                                                    <li class="old__prize" style="text-decoration: line-through;">
                                                        <?php echo "&#x20B9;" . $row['mrp']; ?>
                                                    </li>
                                                    <li><?php echo "&#x20B9;" . $row['price']; ?></li>
                                                </ul>
                                            </td>
                                            <td class="product-action">
                                                <a href="wishlist.php?wishlist_id=<?php echo $row['id']; ?>"><i class="icon-trash icons" style="font-size:xx-large;"></i></a>
                                                <!-- <div class="buttons-cart checkout--btn"> -->
                                                <a href="javascript:void(0)" onclick="manage_cart('<?php echo $row['pid']; ?>', 'add')">
                                                    <i class="icon-handbag icons" style="font-size: xx-large;"></i></a>
                    </div>
                    </td>
                    </tr>
            <?php
                                    }
                                } else {
                                    // If no orders found
                                    echo '<tr><td colspan="6"><b style="color:red; font-size:large;">Nothing wishlisted yet...</b></td></tr>';
                                }
            ?>
            </tbody>
            </table>

            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="buttons-cart--inner">
                        <div class="buttons-cart">
                            <a href="<?php echo SITE_PATH ?>" style="border-radius:50px;">Continue Shopping</a>
                        </div>

                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</div>


<?php require('footer.php') ?>