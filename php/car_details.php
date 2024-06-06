<?php
require 'database.php';

if (isset($_GET['car_id'])) {
    $car_id = $_GET['car_id'];

    $stmt = $pdo->prepare('SELECT * FROM cars WHERE id = ?');
    $stmt->execute([$car_id]);
    $car = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($car) {
        echo json_encode($car);
    } else {
        echo json_encode(['error' => 'Автомобиль не найден']);
    }
} else {
    echo json_encode(['error' => 'Не указан идентификатор автомобиля']);
}
?>
