<?php
require 'database.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['is_admin' => false]);
    exit();
}

$stmt = $pdo->prepare('SELECT role FROM users WHERE id = ?');
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode(['is_admin' => $user['role'] === 'admin']);
?>
