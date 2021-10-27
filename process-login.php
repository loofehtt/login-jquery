<?php
session_start();
if (isset($_POST['do_login'])) {
    $userName = $_POST['userName'];
    $pass = $_POST['password'];

    include 'config.php';
    $sql = "SELECT * FROM db_users WHERE user_email = '$userName' or user_name = '$userName'";
    $result = mysqli_query($conn, $sql);

    //Xác thực
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $pass_hash = $row['user_pass'];
        $status = $row['user_status'];
        if (password_verify($pass, $pass_hash)) {
            echo "success";  //right
        } else {
            echo "wrong"; //wrong
        }
    } else {
        echo "fail"; //doesnt exist
    }
}
