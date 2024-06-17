-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 17 2024 г., 21:34
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_rental`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `booking_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `car_id`, `start_date`, `end_date`, `booking_date`) VALUES
(1, 7, 3, '2024-05-27', '2024-05-28', '2024-05-27'),
(2, 7, 1, '2024-05-27', '2024-06-03', '2024-05-27'),
(3, 7, 2, '2024-05-28', '2024-05-29', '2024-05-27'),
(4, 7, 3, '2024-06-05', '2024-06-07', '2024-05-27'),
(5, 6, 5, '2024-06-08', '2024-06-16', '2024-06-06');

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('Свободен','Забронирован') DEFAULT 'Свободен',
  `image` varchar(255) NOT NULL,
  `power` int(11) NOT NULL,
  `release_year` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `model`, `price`, `status`, `image`, `power`, `release_year`, `description`) VALUES
(1, 'Cayman S', 15990.00, 'Забронирован', '../images/c1.png', 400, 2021, 'Porsche Cayman S 2021 года — это спортивный автомобиль, сочетающий мощь и элегантность. С мощностью 400 лошадиных сил, этот автомобиль обеспечивает впечатляющую динамику и скорость. Элегантный дизайн и современные технологии делают его идеальным выбором для тех, кто ценит высокие стандарты вождения и стиль.'),
(2, 'Boxter S', 23990.00, 'Свободен', '../images/c2.png', 500, 2020, 'Porsche Boxster S 2020 года — это воплощение мощности и изящества в одном автомобиле. С впечатляющей мощностью 500 лошадиных сил, он гарантирует захватывающее вождение и высокую производительность. Современный дизайн, передовые технологии и исключительная управляемость делают этот кабриолет идеальным выбором для ценителей спортивных автомобилей и открытых дорог.'),
(3, 'Cayman GTS', 30990.00, 'Забронирован', '../images/c3.png', 400, 2023, 'Porsche Cayman GTS 2023 года — это спортивный автомобиль, сочетающий в себе мощь и передовые технологии. С 400 лошадиными силами под капотом, этот автомобиль обещает исключительные характеристики и динамику на дороге. Его современный дизайн и изысканная отделка подчеркивают премиальный статус, делая Cayman GTS 2023 идеальным выбором для тех, кто стремится к высочайшему уровню вождения и элегантности.'),
(4, '911 Carrera S', 15990.00, 'Свободен', '../images/911-1.png', 420, 2024, 'Porsche 911 Carrera S 2024 года — это квинтэссенция немецкого инженерного искусства и изысканности. Обладая мощностью 420 лошадиных сил, он дарит исключительные ощущения от вождения, позволяя в полной мере ощутить динамику и маневренность. Этот автомобиль сочетает в себе элегантный, современный дизайн с инновационными технологиями, подчеркивая статус и престиж своего владельца. 911 Carrera S 2024 года создан для тех, кто стремится к высшему уровню автомобильного совершенства.'),
(5, '911 Carrera Cabrio', 25990.00, 'Свободен', '../jpg/911-2.png', 420, 2024, 'Арендуйте Porsche 911 Carrera Cabrio 2024 года и ощутите свободу, которую может предложить только кабриолет. С мощностью 420 лошадиных сил, этот автомобиль обеспечивает непревзойденную динамику и плавность хода. Современный дизайн и инновационные технологии делают его идеальным выбором для тех, кто ценит роскошь и комфорт. Прокатитесь с ветерком, наслаждаясь безупречным стилем и высочайшей производительностью, которые гарантирует Porsche 911 Carrera Cabrio 2024 года.'),
(6, '911 Targa 4s', 10990.00, 'Свободен', '../jpg/911-3.png', 500, 2021, 'Арендуйте Porsche 911 Targa 4S 2021 года и погрузитесь в мир исключительного вождения. С мощностью 500 лошадиных сил, этот автомобиль предлагает великолепную производительность и динамику. Уникальный дизайн Targa сочетается с современными технологиями, создавая неповторимое ощущение открытого неба и свободы. В этом автомобиле роскошь и стиль идут рука об руку, обеспечивая вам незабываемые впечатления от каждой поездки.'),
(7, '911 Turbo', 13990.00, 'Свободен', '../jpg/911t-1.png', 640, 2024, 'Окунитесь в мир непревзойденной скорости и роскоши, арендовав Porsche 911 Turbo 2021 года. С впечатляющей мощностью в 640 лошадиных сил, этот автомобиль готов подарить вам захватывающий опыт вождения, который оставит незабываемые впечатления. Стремительный и элегантный, 911 Turbo сочетает в себе высочайшие технологии и исключительный комфорт. Его утонченный дизайн и аэродинамичные линии подчеркивают статус и стиль, а невероятная производительность заставит ваше сердце биться быстрее. Арендуйте Porsche 911 Turbo 2021 года и испытайте настоящий адреналин и удовольствие от управления этим шедевром автомобильного искусства.'),
(8, '911 Turbo S Cabrio', 20990.00, 'Свободен', '../jpg/911t-2.png', 640, 2023, 'Погрузитесь в мир роскоши и неукротимой силы, арендовав Porsche 911 Turbo S Cabrio 2023 года. Этот великолепный кабриолет с мощностью 640 лошадиных сил обещает невероятное ускорение и незабываемый опыт вождения. Сочетая элегантный дизайн и новейшие технологии, 911 Turbo S Cabrio предлагает высочайший комфорт и управляемость. Откройте крышу и наслаждайтесь ветром в волосах, путешествуя в стиле и скорости. Арендуйте Porsche 911 Turbo S Cabrio 2023 года и ощутите настоящий дух свободы и мощи на дороге.'),
(9, 'Taycan GTS', 10990.00, 'Свободен', '../jpg/t1.png', 550, 2022, 'Испытайте будущее на колесах, арендовав Porsche Taycan GTS 2022 года. С мощностью 550 лошадиных сил, этот полностью электрический спортивный автомобиль предлагает молниеносное ускорение и превосходную динамику вождения. Его элегантный и современный дизайн подчеркивает инновационность и роскошь, а высокотехнологичный интерьер обеспечивает максимальный комфорт и удобство. Наслаждайтесь бесшумной, но мощной ездой, которая не оставит равнодушным ни одного ценителя автомобилей. Арендуйте Porsche Taycan GTS 2022 года и откройте для себя захватывающий мир электромобильности и превосходной производительности.'),
(10, 'Taycan GTS Turismo', 15990.00, 'Свободен', '../jpg/t2.png', 600, 2023, 'Откройте для себя сочетание передовых технологий и захватывающей мощности, арендовав Porsche Taycan GTS Turismo 2023 года. С впечатляющей мощностью в 600 лошадиных сил, этот электрический спортивный универсал дарит невероятную динамику и молниеносное ускорение. Элегантный дизайн и просторный салон делают каждую поездку комфортной и стильной. Современные технологии и премиальные материалы интерьера подчеркивают роскошь и инновационность этого автомобиля. Арендуйте Porsche Taycan GTS Turismo 2023 года и наслаждайтесь непревзойденной производительностью и комфортом на каждом километре пути.'),
(11, 'Macan', 10990.00, 'Свободен', '../jpg/m1.png', 350, 2020, 'Погрузитесь в мир динамичного вождения и роскоши, арендовав Porsche Macan 2020 года. Этот стильный и мощный кроссовер с 350 лошадиными силами под капотом предлагает превосходную производительность и маневренность на любых дорогах. Элегантный дизайн, просторный салон и высококачественные материалы создают атмосферу комфорта и премиального стиля. Современные технологии и инновационные функции обеспечивают безопасность и удобство в каждой поездке. Арендуйте Porsche Macan 2020 года и наслаждайтесь идеальным сочетанием мощности, элегантности и практичности.'),
(12, 'Macan GTS', 13990.00, 'Свободен', '../jpg/m2.png', 400, 2022, 'Арендуйте Porsche Macan GTS 2022 года и испытайте непревзойденное сочетание мощности и роскоши. С мощностью 400 лошадиных сил, этот высокопроизводительный кроссовер обеспечивает впечатляющее ускорение и превосходную управляемость. Современный и элегантный дизайн Macan GTS подчеркивает его спортивный характер, а комфортабельный и технологичный интерьер предлагает высочайший уровень удобства и безопасности. Наслаждайтесь каждой поездкой, ощутите динамику и стиль Porsche. Арендуйте Macan GTS 2022 года и откройте для себя новый стандарт вождения.'),
(13, 'Cayenne 4S', 10990.00, 'Свободен', '../jpg/ct1.png', 500, 2024, 'Ощутите мощь и изысканность, арендовав Porsche Cayenne 4S 2024 года. Этот премиальный внедорожник с 500 лошадиными силами под капотом обеспечивает невероятную производительность и комфорт на любом маршруте. Элегантный и современный дизайн Cayenne 4S подчеркивает его спортивный дух, а просторный и роскошный салон, оснащенный передовыми технологиями, обеспечивает максимальное удобство и безопасность для всех пассажиров. Арендуйте Porsche Cayenne 4S 2024 года и насладитесь безупречной ездой, сочетающей в себе мощь, стиль и инновации.'),
(14, 'Cayenne Turbo', 18990.00, 'Свободен', '../jpg/ct2.png', 540, 2024, 'Испытайте непревзойденную мощь и элегантность, арендовав Porsche Cayenne Turbo 2024 года. С впечатляющей мощностью 540 лошадиных сил, этот внедорожник обеспечивает невероятное ускорение и превосходную управляемость. Элегантный и современный дизайн Cayenne Turbo подчеркивает его спортивный характер, а роскошный интерьер с передовыми технологиями предлагает высочайший уровень комфорта и безопасности. Арендуйте Porsche Cayenne Turbo 2024 года и наслаждайтесь каждой поездкой, ощущая сочетание мощности, стиля и инноваций, которое предлагает этот выдающийся автомобиль.'),
(15, 'Panamera 4s', 19990.00, 'Свободен', '../jpg/p1.png', 490, 2023, 'Почувствуйте роскошь и динамику, арендовав Porsche Panamera 4S 2023 года. Этот седан с мощностью 490 лошадиных сил обеспечивает невероятное ускорение и уверенное вождение на любой дороге. Современный и изысканный дизайн Panamera 4S подчеркивает его высокий статус и спортивный характер. Просторный и стильный интерьер, наполненный передовыми технологиями, обеспечивает максимальный комфорт и удобство для всех пассажиров. Арендуйте Porsche Panamera 4S 2023 года и ощутите сочетание роскоши и производительности, которое только Porsche может предложить.'),
(16, 'Panamera GTS Turismo', 28990.00, 'Свободен', '../jpg/p2.png', 590, 2023, 'Почувствуйте мощь и изысканность, арендовав Porsche Panamera GTS Turismo 2023 года. Этот спортивный универсал с мощностью 590 лошадиных сил обеспечивает невероятное ускорение и динамичное вождение. Уникальный и элегантный дизайн Panamera GTS Turismo подчеркивает его спортивный характер и высокий статус. Просторный и роскошный интерьер с передовыми технологиями обеспечивает максимальный комфорт и удовольствие от каждой поездки. Арендуйте Porsche Panamera GTS Turismo 2023 года и насладитесь великолепным сочетанием производительности и роскоши, которое только Porsche способен предоставить.'),
(17, 'Panamera Turbo', 29990.00, 'Свободен', '../jpg/p3.png', 650, 2024, 'Почувствуйте мощь и роскошь, арендуя Porsche Panamera Turbo 2024 года. Этот седан с мощностью 650 лошадиных сил предлагает впечатляющую производительность и уверенное вождение. Современный и изысканный дизайн Panamera Turbo выражает элегантность и спортивный стиль. Просторный и комфортабельный интерьер с передовыми технологиями обеспечивает максимальное удовольствие от каждой поездки. Арендуйте Porsche Panamera Turbo 2024 года и ощутите на себе роскошь и мощь, которые только Porsche способен предложить.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `full_name`, `phone`, `role`) VALUES
(1, 'test', '$2y$10$5PmHqw4VGGYPZqgQQiIgPubfQQE4SHyiQYhodMjbW/FgLEBusgBe2', 'test@test.ru', 'test test test', '+79999999999', 'user'),
(4, 'admin', '$2y$10$xkz6EuhRdQehOc1IKrTn7uULnqZutmDJ8mfCvbVtzv/ln9WD7tjn.', 'admin@example.com', 'Admin User', '1234567890', 'admin'),
(6, 'Amiriri', '$2y$10$NbTkYkaCE2a8Cev.Hyu6zOS8rUqRR7Oj6IB15YFz.HojzSxYGy88m', 'amir@yandex.ru', 'Amir Amir Amir', '+70000000000', 'user'),
(7, 'test_user', '$2y$10$OIDltNmVCpcqBDw661pNOeeg1F76SNwV8gH9pJedlFlvLPVkIC5VG', 'user@test.ru', 'test test test', '8983123947', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
