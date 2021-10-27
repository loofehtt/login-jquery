-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2021 lúc 12:41 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phonebook`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_employees`
--

CREATE TABLE `db_employees` (
  `emp_id` int(10) UNSIGNED NOT NULL,
  `emp_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_mobile` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_employees`
--

INSERT INTO `db_employees` (`emp_id`, `emp_name`, `emp_position`, `emp_email`, `emp_mobile`, `office_id`) VALUES
(1, 'Trần Mạnh Tuấn', 'Trưởng BM', 'tmtuan@tlu.edu.vn', '0983555566', 5),
(2, 'Kiều Tuấn Dũng', 'Giảng viên', 'dungkt@tlu.edu.vn', '0988811122', 5),
(3, 'Nguyễn Văn Phú', 'Sinh Viên', 'phu832001@gmail.com', '+843422984', 3),
(6, 'Nguyễn Đức Kiên', 'Sinh Viên', 'kienga@gmail.com', '98000000', 3),
(7, 'Dương Giáp Đức', 'Sinh Viên', 'gd2001@gmail.com', '0999999999', 3),
(8, 'Nguyễn Hoài Phương', 'Sinh Viên', 'nhp2001@gmail.com', '088888888', 3),
(9, 'Nguyễn Khương Duy', 'Sinh Viên', 'duyga@gmail.com', '98000000', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_offices`
--

CREATE TABLE `db_offices` (
  `office_id` int(10) UNSIGNED NOT NULL,
  `office_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_parent` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_offices`
--

INSERT INTO `db_offices` (`office_id`, `office_name`, `office_phone`, `office_email`, `office_website`, `office_address`, `office_parent`) VALUES
(3, 'Khoa CNTT', '0243555666', 'cntt@tlu.edu.vn', 'cntt.tlu.edu.vn', 'Nhà C1 - Trường ĐHTL', NULL),
(4, 'Khoa Kinh tế', '0243555777', 'kinhte@tlu.edu.vn', 'kinhte.tlu.edu.vn', 'Nhà B1 - Trường ĐHTL', NULL),
(5, 'Bộ môn HTTT', '0243555888', 'httt@tlu.edu.vn', '', 'Phòng 201 - Nhà C1 - Trường ĐHTL', 3),
(6, 'Bộ môn Toán học', '0243555999', 'toanhoc@tlu.edu.vn', '', 'Phòng 202 - Nhà C1 - Trường ĐHTL', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_users`
--

CREATE TABLE `db_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_pass` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_regis_date` datetime DEFAULT current_timestamp(),
  `user_status` tinyint(1) DEFAULT 0,
  `user_level` tinyint(1) DEFAULT 0,
  `user_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_users`
--

INSERT INTO `db_users` (`user_id`, `user_name`, `user_email`, `user_pass`, `user_regis_date`, `user_status`, `user_level`, `user_code`) VALUES
(47, 'phu8301', 'phu83001@gmail.com', '$2y$10$z1D3vhDghWlHJPrnpm2z.OqXpot3JXK6QS0k4k.bol4uKac4HL8Ty', '2021-10-17 18:44:27', 1, 0, '4b35bc74d9ffd2ae43ad893e39ca7121'),
(48, 'admin', 'phu832001@gmail.com', '$2y$10$uaoM0hRaexl/cwYeTP5dSeVS0I7F.5G10eyDhJgzM0WttRwbVJjHy', '2021-10-27 11:13:00', 1, 1, '00f0a4ba9739aa3851db70a59539ccc0');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `db_employees`
--
ALTER TABLE `db_employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Chỉ mục cho bảng `db_offices`
--
ALTER TABLE `db_offices`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `office_parent` (`office_parent`);

--
-- Chỉ mục cho bảng `db_users`
--
ALTER TABLE `db_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `db_employees`
--
ALTER TABLE `db_employees`
  MODIFY `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `db_offices`
--
ALTER TABLE `db_offices`
  MODIFY `office_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `db_users`
--
ALTER TABLE `db_users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `db_employees`
--
ALTER TABLE `db_employees`
  ADD CONSTRAINT `db_employees_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `db_offices` (`office_id`);

--
-- Các ràng buộc cho bảng `db_offices`
--
ALTER TABLE `db_offices`
  ADD CONSTRAINT `db_offices_ibfk_1` FOREIGN KEY (`office_parent`) REFERENCES `db_offices` (`office_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
