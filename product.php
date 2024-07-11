<?php
require('top.php');

if (isset($_GET['type']) && $_GET['type'] != '') {
    $type = get_safe_value($conn, $_GET['type']);
    if ($type == 'status') {
        $operation = get_safe_value($conn, $_GET['operation']);
        $id = get_safe_value($conn, $_GET['id']);
        if ($operation == 'active') {
            $status = '1';
        } else {
            $status = '0';
        }
        $update_status_sql = "update product set status='$status' where id='$id'";
        mysqli_query($conn, $update_status_sql);
    }

    if ($type == 'delete') {
        $id = get_safe_value($conn, $_GET['id']);
        $delete_sql = "delete from product where id='$id'";
        mysqli_query($conn, $delete_sql);
    }
}

$sql = "select product.*,categories.categories from product,categories where product.categories_id=categories.id order by product.id desc";
$res = mysqli_query($conn, $sql);
?>
<div class="content pb-0">
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="box-title">Products </h4>
                        <h4 class="box-link"><a href="manage_product.php">Add Product</a> </h4>
                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th class="serial">#</th>
                                        <th>ID</th>
                                        <th>Categories</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>MRP</th>
                                        <th>Price</th>
                                        <th>Qty</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    while ($row = mysqli_fetch_assoc($res)) { ?>
                                        <tr>
                                            <td class="serial"><?php echo $i ?></td>
                                            <td><?php echo $row['id'] ?></td>
                                            <td><?php echo $row['categories'] ?></td>
                                            <td><?php echo $row['name'] ?></td>
                                            <td><img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $row['image'] ?>" /></td>
                                            <td><?php echo $row['mrp'] ?></td>
                                            <td><?php echo $row['price'] ?></td>
                                            <td>Total Qty: <?php echo $row['qty'] ?>
                                                <br />
                                                <?php
                                                $productSoldQtyByProductId = productSoldQtyByProductId($conn, $row['id']);
                                                $pneding_qty = $row['qty'] - $productSoldQtyByProductId;

                                                ?>
                                                Remaining Qty :<?php echo $pneding_qty ?>

                                            </td>
                                            </td>
                                            <td>
                                            <?php
                                            if ($row['status'] == 1) {
                                                echo "<button type='button' class='btn btn-success' style='color: white; font-weight: bold;'><a href='?type=status&operation=deactive&id=" . $row['id'] . "' style='color: inherit; text-decoration: none;'>Active</a></button>&nbsp";
                                            } else {
                                                echo "<button type='button' class='btn btn-warning' style='color: white; font-weight: bold;'><a href='?type=status&operation=active&id=" . $row['id'] . "' style='color: inherit; text-decoration: none;'>Deactive</a></button>&nbsp";
                                            }

                                            echo "<button type='button' class='btn btn-info' style='color: white; font-weight: bold;'><a href='manage_product.php?id=" . $row['id'] . "' style='color: inherit; text-decoration: none;'>Edit</a></button>&nbsp";

                                            echo "<button type='button' class='btn btn-danger' style='color: white; font-weight: bold;'><a href='?type=delete&id=" . $row['id'] . "' style='color: inherit; text-decoration: none;'>Delete</a></button>";
                                        } ?>
                                            </td>
                                        </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require('footer.php');
?>