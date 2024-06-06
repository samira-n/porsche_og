<?php
session_start();

require 'database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $email = $_POST['email'];
    $full_name = $_POST['full_name'];
    $phone = $_POST['phone'];

    $stmt = $pdo->prepare('INSERT INTO users (username, password, email, full_name, phone) VALUES (?, ?, ?, ?, ?)');
    if ($stmt->execute([$username, $password, $email, $full_name, $phone])) {
        header('Location: ../html/login.html');
        exit();
    } else {
        echo 'Ошибка регистрации';
    }
}
?>
