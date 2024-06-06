<?php
require 'database.php';

$data = json_decode(file_get_contents('php://input'), true);
$car_id = $data['car_id'];
$status = $data['status'];

$stmt = $pdo->prepare('UPDATE cars SET status = ? WHERE id = ?');
if ($stmt->execute([$status, $car_id])) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}
?>
