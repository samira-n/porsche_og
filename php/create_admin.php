<?php
require 'database.php';

// Хеширование пароля
$passwordHash = password_hash('admin', PASSWORD_DEFAULT);

// Вставка администратора в базу данных
$stmt = $pdo->prepare('INSERT INTO users (username, password, email, full_name, phone, role) VALUES (?, ?, ?, ?, ?, ?)');
$stmt->execute(['admin', $passwordHash, 'admin@example.com', 'Admin User', '1234567890', 'admin']);

echo "Admin user created successfully.";
?>
