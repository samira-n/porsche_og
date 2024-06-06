<?php
session_start();
require 'database.php';

if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'admin') {
    echo json_encode(['success' => false, 'message' => 'Access denied']);
    exit;
}

$stmt = $pdo->query('SELECT bookings.booking_date, users.username, cars.model, bookings.start_date, bookings.end_date
                    FROM bookings 
                    JOIN users ON bookings.user_id = users.id 
                    JOIN cars ON bookings.car_id = cars.id');
$bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Административная панель - Бронирования</title>
    <link rel="stylesheet" href="../css/booking.css">
</head>
<body>
    <h1>Бронирования</h1>
    <table>
        <thead>
            <tr>
                <th>Дата бронирования</th>
                <th>Пользователь</th>
                <th>Модель автомобиля</th>
                <th>Начало брони</th>
                <th>Конец брони</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($bookings as $booking): ?>
                <tr>
                    <td><?= $booking['booking_date'] ?></td>
                    <td><?= $booking['username'] ?></td>
                    <td><?= $booking['model'] ?></td>
                    <td><?= $booking['start_date'] ?></td>
                    <td><?= $booking['end_date'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
