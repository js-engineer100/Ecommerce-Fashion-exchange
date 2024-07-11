<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once './dompdf/autoload.inc.php';
require ('connection.php');
require ('functions.php');
use Dompdf\Dompdf;
use Dompdf\Options;

// Session check
if (!isset($_SESSION['ADMIN_LOGIN']) && !isset($_SESSION['USER_ID'])) {
    die();
}
// Check if id parameter is set in the URL
if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("Order ID is missing or invalid.");
}

// Get order ID
$order_id = get_safe_value($conn, $_GET['id']);
$coupon_details = mysqli_fetch_assoc(mysqli_query($conn, "select coupon_value from `order` where id='$order_id'"));

$coupon_value = $coupon_details['coupon_value'];

// Load CSS files
$css = file_get_contents('css/bootstrap.min.css');
$css .= file_get_contents('style.css');

// HTML content for PDF
$html = '<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>' . $css . '</style>
</head>
<body>
<div class="wishlist-table table-responsive">
   <table>
      <thead>
         <tr>
            <th class="product-thumbnail">Product Name</th>
            <th class="product-thumbnail">Product Image</th>
            <th class="product-name">Qty</th>
            <th class="product-price">Price</th>
            <th class="product-price">Total Price</th>
         </tr>
      </thead>
      <tbody>';

if (isset($_SESSION['ADMIN_LOGIN'])) {
    $res = mysqli_query($conn, "select distinct(order_detail.id), order_detail.*, product.name, product.image from order_detail, product, `order` where order_detail.order_id='$order_id' and order_detail.product_id=product.id");
} else {
    $uid = $_SESSION['USER_ID'];
    $res = mysqli_query($conn, "select distinct(order_detail.id), order_detail.*, product.name, product.image from order_detail, product, `order` where order_detail.order_id='$order_id' and `order`.user_id='$uid' and order_detail.product_id=product.id");
}


$total_price = 0;
if (mysqli_num_rows($res) > 0) {
    while ($row = mysqli_fetch_assoc($res)) {
        $total_price += ($row['qty'] * $row['price']);
        $pp = $row['qty'] * $row['price'];
        $html .= '<tr>
            <td class="product-name">' . $row['name'] . '</td>
            <td class="product-name"><img src="' . PRODUCT_IMAGE_SITE_PATH . $row['image'] . '" style="height:200px; width:200px;"></td>
            <td class="product-name">' . $row['qty'] . '</td>
            <td class="product-name">' . 'Rs.' . $row['price'] . '</td>
            <td class="product-name">' . 'Rs.' . $pp . '</td>
         </tr>';
    }

    if ($coupon_value != '') {
        $html .= '<tr>
				<td colspan="3"></td>
				<td class="product-name">Coupon Value</td>
				<td class="product-name">' . 'Rs.' . $coupon_value . '</td>
				
			</tr>';
    

    $total_price = $total_price - $coupon_value;
    $html .= '<tr>
				<td colspan="3"></td>
				<td class="product-name">Total Price</td>
				<td class="product-name">' . 'Rs.' . $total_price . '</td>
				
			</tr>';

    $html .= '</tbody>
   </table>
</div>';
}
}
// die("vedya");

// Initialize Dompdf object
$options = new Options();
$options->set('isHtml5ParserEnabled', true); // Enable HTML5 parser
$options->set('isPhpEnabled', true); // Enable PHP support in the HTML (optional)
$options->set('isRemoteEnabled', true); // Enable fetching external stylesheets
$dompdf = new Dompdf($options);

// Load HTML content
$dompdf->loadHtml($html);

// (Optional) Set the paper size and orientation
$dompdf->setPaper('A4', 'portrait'); // Change 'A4' to other formats if needed ('letter', 'legal', 'A3', etc.)

// Render HTML as PDF
$dompdf->render();

// Output the generated PDF (inline or download)
$file = 'order_invoice' . time() . '.pdf';
$dompdf->stream($file);
?>