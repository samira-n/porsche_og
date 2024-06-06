<?php
session_start();
require 'database.php';

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    echo json_encode(['success' => false, 'message' => 'Access denied']);
    exit;
}

$stmt = $pdo->prepare('
    SELECT rentals.id, users.full_name, users.email, cars.model, cars.price, rentals.start_date, rentals.end_date
    FROM rentals
    JOIN users ON rentals.user_id = users.id
    JOIN cars ON rentals.car_id = cars.id
');
$stmt->execute();
$rentals = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($rentals);
?>
