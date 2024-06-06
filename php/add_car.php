<?php
require 'database.php';

$model = $_POST['model'];
$price = $_POST['price'];
$image = $_POST['image'];
$power = $_POST['power'];
$release_year = $_POST['release_year'];
$description = $_POST['description'];

$stmt = $pdo->prepare('INSERT INTO cars (model, price, image, status, power, release_year, description) VALUES (?, ?, ?, ?, ?, ?, ?)');
if ($stmt->execute([$model, $price, $image, 'Свободен', $power, $release_year, $description])) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}
?>
