<?php
require('top.php');
require_once('./vendor/autoload.php');


\Stripe\Stripe::setApiKey('your stripe secret key');


// Check if session_id is present in the URL
if (isset($_GET['session_id'])) {
    try {
        // Retrieve the Checkout Session from the session_id
        $session = \Stripe\Checkout\Session::retrieve($_GET['session_id']);

        if ($session->payment_status === 'paid') {

            $payment_id = $session->payment_intent;
            $payment_status = $session->payment_status;

            $order_id = $session->metadata['order_id'];
            mysqli_query($conn, "UPDATE `order` SET payment_status='$payment_status', payment_id='$payment_id' WHERE id='$order_id'");

?>
            <script>
                window.location.href = 'thank_you.php';
            </script>
        <?php

        } else {

            mysqli_query($conn, "UPDATE `order` SET payment_status='$payment_status', payment_id='$payment_id' WHERE id='$order_id'");
        ?>
            <script>
                window.location.href = 'payment_fail.php'
            </script><?php
                        exit;
                    }
                } catch (Exception $e) {
                    echo 'Error retrieving payment information: ' . $e->getMessage();
                }
            } else {
                echo 'Session ID not provided.';
            }
                        ?>
