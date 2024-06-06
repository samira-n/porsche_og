<?php
require 'database.php';

$data = json_decode(file_get_contents('php://input'), true);
$car_id = $data['car_id'];
$price = $data['price'];

$stmt = $pdo->prepare('UPDATE cars SET price = ? WHERE id = ?');
if ($stmt->execute([$price, $car_id])) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}

?>
