<?php
require 'database.php';

session_start();
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Необходима авторизация.']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
$car_id = $data['car_id'];
$start_date = $data['start_date'];
$end_date = $data['end_date'];
$user_id = $_SESSION['user_id']; // Получаем идентификатор текущего пользователя

$stmt = $pdo->prepare('SELECT status FROM cars WHERE id = ?');
$stmt->execute([$car_id]);
$car = $stmt->fetch(PDO::FETCH_ASSOC);

if ($car && $car['status'] === 'Свободен') {
    // Обновляем статус автомобиля в таблице cars
    $stmt = $pdo->prepare('UPDATE cars SET status = ? WHERE id = ?');
    if ($stmt->execute(['Забронирован', $car_id])) {
        // Добавляем новую запись в таблицу bookings
        $stmt = $pdo->prepare('INSERT INTO bookings (user_id, car_id, start_date, end_date) VALUES (?, ?, ?, ?)');
        if ($stmt->execute([$user_id, $car_id, $start_date, $end_date])) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка при добавлении записи в таблицу бронирований.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Ошибка при обновлении статуса автомобиля.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Автомобиль уже забронирован или в ремонте.']);
}
?>