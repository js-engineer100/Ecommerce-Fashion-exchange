<?php
function pr($arr)
{
	echo '<pre>';
	print_r($arr);
}
function prx($arr)
{
	echo '<pre>';
	print_r($arr);
}

function get_safe_value($conn, $str)
{
	if ($str != '') {
		$str = trim($str);
		return mysqli_real_escape_string($conn, $str);
	}
}
function redirect($url)
{
?>
	<script>
		window.location.href = "<?php echo $url ?>";
	</script>
	<?php
}
function productSoldQtyByProductId($conn, $pid)
{
	$sql = "select sum(order_detail.qty) as qty from order_detail,`order` where `order`.id=order_detail.order_id and order_detail.product_id=$pid and `order`.order_status!=4";
	$res = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($res);
	return $row['qty'];
}
function isAdmin()
{
	if (!isset($_SESSION['ADMIN_LOGIN'])) {
	?>
		<script>
			window.location.href = 'login.php';
		</script>
	<?php
	}
	if ($_SESSION['ADMIN_ROLE'] == 1) {
	?>
		<script>
			window.location.href = 'product.php';
		</script>
<?php
	}
}
function imageCompress($source, $path, $quality = 60)
{
	$arr = getimagesize($source);
	if ($arr['mime'] == "image/png") {
		$i = imagecreatefrompng($source);
	} else {
		$i = imagecreatefromjpeg($source);
	}
	imagejpeg($i, $path, $quality);
}
?>