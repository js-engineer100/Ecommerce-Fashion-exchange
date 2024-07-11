<?php
require ('connection.php');
require ('functions.php');

$email = get_safe_value($conn, $_POST['email']);
$password = get_safe_value($conn, $_POST['password']);

$res = mysqli_query($conn, "SELECT * FROM users WHERE email='$email'");
$check_user = mysqli_num_rows($res);

if ($check_user > 0) {
    $row = mysqli_fetch_assoc($res);
    if (password_verify($password, $row['password'])) {
        session_start();
        $_SESSION['USER_LOGIN'] = 'yes';
        $_SESSION['USER_ID'] = $row['id'];
        $_SESSION['USER_NAME'] = $row['name'];
        if (isset($_SESSION['WISHLIST_ID']) && $_SESSION['WISHLIST_ID'] != '') {
            wishlist_add($conn, $_SESSION['USER_ID'], $_SESSION['WISHLIST_ID']);
            unset($_SESSION['WISHLIST_ID']);
        }

        echo "valid";
    } else {
        echo "wrong";
    }
}