<?php
require 'database.php';

$data = json_decode(file_get_contents('php://input'), true);
$car_id = $data['car_id'];

$stmt = $pdo->prepare('DELETE FROM cars WHERE id = ?');
if ($stmt->execute([$car_id])) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}
?>
