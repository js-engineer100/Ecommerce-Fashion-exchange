<?php
require ('connection.php');
require ('functions.php');

$type = get_safe_value($conn, $_POST['type']);
$otp_received = get_safe_value($conn, $_POST['otp']);

if ($type == 'email') {
    $email = get_safe_value($conn, $_POST['email']);

    // Decrypt the OTP stored in the session
    $key = "a8d94b7f70828f91495d5e3a22b84a7bf3fe83c0fb9a27db1d3e863334f55c0e";// Same secret key used for encryption
    $decoded_otp = base64_decode($_SESSION['EMAIL_OTP']);
    $decrypted_otp = openssl_decrypt($decoded_otp, 'AES-256-CBC', $key, 0, 'your_iv');

    if ($otp_received == $decrypted_otp) {
        echo 'done';
    } else {
        echo 'OTP does not match';
    }
}

if ($type == 'mobile') {
    $mobile = get_safe_value($conn, $_POST['mobile']);

    // Decrypt the OTP stored in the session
    $key = "a8d94b7f70828f91495d5e3a22b84a7bf3fe83c0fb9a27db1d3e863334f55c0e";
    $decoded_otp = base64_decode($_SESSION['MOBILE_OTP']);
    $decrypted_otp = openssl_decrypt($decoded_otp, 'AES-256-CBC', $key, 0, 'your_iv');

    if ($otp_received == $decrypted_otp) {
        echo 'done';
    } else {
        echo 'OTP does not match';
    }
}
?>