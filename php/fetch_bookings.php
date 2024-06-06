<?php
require 'database.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Пользователь не авторизован']);
    exit();
}

$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare('SELECT b.id AS booking_id, c.model, c.price, b.status FROM bookings b JOIN cars c ON b.car_id = c.id WHERE b.user_id = ?');
$stmt->execute([$user_id]);
$bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($bookings);
?>
