<?php
session_start();

require 'database.php';


$stmt = $pdo->query('SELECT * FROM cars');
$cars = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($cars);
?>
