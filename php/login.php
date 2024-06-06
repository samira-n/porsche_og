<?php
require 'database.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $pdo->prepare('SELECT id, password, role FROM users WHERE username = ?');
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_role'] = $user['role']; // Сохраняем роль пользователя в сессии

        if ($user['role'] === 'admin') {
            header('Location: ../html/admin.html'); // Перенаправление администратора на админ панель
        } else {
            header('Location: ../html/cars.html'); // Перенаправление обычного пользователя на страницу автомобилей
        }
        exit();
    } else {
        echo 'Неправильный логин или пароль';
    }
}
?>
