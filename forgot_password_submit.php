<?php
require ('connection.php');
require ('functions.php');

$email = get_safe_value($conn, $_POST['email']);
$res = mysqli_query($conn, "SELECT * FROM users WHERE email='$email'");
$check_user = mysqli_num_rows($res);

if ($check_user > 0) {
    $row = mysqli_fetch_assoc($res);
    $pwd = $row['password'];
    $subject = "Your Password";
    $message = "Your password is <strong>$pwd</strong>";
    $headers = "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
    $headers .= "From: studentresultphp@gmail.com" . "\r\n";

    if (mail($email, $subject, $message, $headers)) {
        echo "Please check your email id for password";
    } else {
        echo "Error occur";
    }
} else {
    echo "Email id not registered with us";
    die();
}
?>