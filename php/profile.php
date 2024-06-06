<?php
session_start();
require 'database.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['logged_in' => false]);
    exit;
}

$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare('SELECT username, email, full_name, phone FROM users WHERE id = ?');
$stmt->execute([$user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode(['logged_in' => true, 'username' => $user['username'], 'email' => $user['email'], 'full_name' => $user['full_name'], 'phone' => $user['phone']]);
?>
