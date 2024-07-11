<?php
require ('connection.php');
require ('functions.php');

// Check if user is logged in
if (!isset($_SESSION['USER_LOGIN'])) {
    ?>
    <script>
        window.location.href = 'index.php';
    </script>
    <?php
    exit; // Stop further execution
}

$current_password = get_safe_value($conn, $_POST['current_password']);
$new_password = get_safe_value($conn, $_POST['new_password']);
$uid = $_SESSION['USER_ID'];

// Fetch hashed password from database
$result = mysqli_query($conn, "SELECT password FROM users WHERE id='$uid'");
$row = mysqli_fetch_assoc($result);

if (!$row) {
    echo "User not found";
} else {
    $hashed_password = $row['password'];

    // Verify current password
    if (password_verify($current_password, $hashed_password)) {
        // Hash the new password before updating
        $hashed_new_password = password_hash($new_password, PASSWORD_BCRYPT);

        // Update hashed password in database
        mysqli_query($conn, "UPDATE users SET password='$hashed_new_password' WHERE id='$uid'");

        echo "Password updated";
    } else {
        echo "Please enter your current valid password";
    }
}
?>