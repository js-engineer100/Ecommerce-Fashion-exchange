<?php
require ('top.php');
error_reporting(E_ALL);

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
        $update_status_sql = "update coupon_master set status='$status' where id='$id'";
        mysqli_query($conn, $update_status_sql);
    }

    if ($type == 'delete') {
        $id = get_safe_value($conn, $_GET['id']);
        $delete_sql = "delete from coupon_master where id='$id'";
        mysqli_query($conn, $delete_sql);
    }
}

$sql = "select * from coupon_master order by id desc";
$res = mysqli_query($conn, $sql);
?>
<div class="content pb-0">
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="box-title">Coupon Master </h4>
                        <h4 class="box-link"><a href="manage_coupon_master.php">Add Coupon</a> </h4>
                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th class="serial">#</th>
                                        <th width="2%">ID</th>
                                        <th width="20%">Coupon Code</th>
                                        <th width="20%">Coupon Value</th>
                                        <th width="20%">Coupon Type</th>
                                        <th width="10%">Min Value</th>
                                        <th width="26%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    while ($row = mysqli_fetch_assoc($res)) { ?>
                                        <tr>
                                            <td class="serial"><?php echo $i ?></td>
                                            <td><?php echo $row['id'] ?></td>
                                            <td><?php echo $row['coupon_code'] ?></td>
                                            <td><?php echo $row['coupon_value'] ?></td>
                                            <td><?php echo $row['coupon_type'] ?></td>
                                            <td><?php echo $row['cart_min_value'] ?></td>

                                            <td>
                                                <?php
                                                if ($row['status'] == 1) {
                                                    echo "<button type='button' class='btn btn-success' style='color: white; font-weight: bold;'><a href='?type=status&operation=deactive&id=" . $row['id'] . "' style='color: inherit; text-decoration: none;'>Active</a></button>&nbsp";
                                                } else {
                                                    echo "<button type='button' class='btn btn-warning' style='color: white; font-weight: bold;'><a href='?type=status&operation=active&id=" . $row['id'] . "' style='color: inherit; text-decoration: none;'>Deactive</a></button>&nbsp";
                                                }

                                                echo "<button type='button' class='btn btn-info' style='color: white; font-weight: bold;'><a href='manage_coupon_master.php?id=" . $row['id'] . "' style='color: inherit; text-decoration: none;'>Edit</a></button>&nbsp";

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
require ('footer.php');
?>