<?php
session_start();
if (isset($_POST['do_login'])) { //phải bấm đăng nhập thì mới vào được trang này
    $userName = $_POST['userName'];
    $password = $_POST['password'];

    include 'config.php';
    $sql = "SELECT * FROM db_users WHERE user_email = '$userName' or user_name = '$userName'";
    $result = mysqli_query($conn, $sql);

    //Xác thực
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $pass_hash = $row['user_pass'];
        $level = $row['user_level'];
        if (password_verify($password, $pass_hash)) {
            if ($level == 0) { //Kiểm tra user level
                echo "admin";  //admin
            } else {
                echo "student"; //student
            }
        } else {
            echo "wrong"; //sai password
        }
    } else {
        echo "fail"; //sai username
    }
} else header('location:login.php'); //chuyển về trang đăng nhập
