<?php
require ('connection.php');
require ('functions.php');

$type = get_safe_value($conn, $_POST['type']);

// Generate OTP
$otp = rand(1111, 9999);

if ($type == 'email') {
    $email = get_safe_value($conn, $_POST['email']);
    $check_user = mysqli_num_rows(mysqli_query($conn, "select * from users where email='$email'"));
    if ($check_user > 0) {
        echo "email_present";
        die();
    }

    // Encrypt the OTP
    $key = "a8d94b7f70828f91495d5e3a22b84a7bf3fe83c0fb9a27db1d3e863334f55c0e";
    $encrypted_otp = base64_encode(openssl_encrypt($otp, 'AES-256-CBC', $key, 0, 'your_iv'));

    $_SESSION['EMAIL_OTP'] = $encrypted_otp;
    $subject = 'Your OTP';
    $message = $otp . ' is your OTP';
    $headers = 'From: studentresultphp@gmail.com' . "\r\n" .
        'Reply-To: studentresultphp@gmail.com' . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

    // Send email
    if (mail($email, $subject, $message, $headers)) {
        echo 'done';
    } else {
        echo 'Failed to send email.';
    }
}

if ($type == 'mobile') {
    $mobile = get_safe_value($conn, $_POST['mobile']);
    $check_mobile = mysqli_num_rows(mysqli_query($conn, "select * from users where mobile='$mobile'"));
    if ($check_mobile > 0) {
        echo "mobile_present";
        die();
    }

    // Encrypt the OTP
    $key = "a8d94b7f70828f91495d5e3a22b84a7bf3fe83c0fb9a27db1d3e863334f55c0e";
    $encrypted_otp = base64_encode(openssl_encrypt($otp, 'AES-256-CBC', $key, 0, 'your_iv'));

    $_SESSION['MOBILE_OTP'] = $encrypted_otp;
    $message = "$otp is your otp";

    $mobile = '91' . $mobile;
    $apiKey = urlencode('API_KEY');
    $numbers = array($mobile);
    $sender = urlencode('TXTLCL');
    $message = rawurlencode($message);
    $numbers = implode(',', $numbers);
    $data = array('apikey' => $apiKey, 'numbers' => $numbers, "sender" => $sender, "message" => $message);
    $ch = curl_init('https://api.textlocal.in/send/');
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);
    echo "done";
}
?>
s