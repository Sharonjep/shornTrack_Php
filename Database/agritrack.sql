

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `admin` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = admin',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`branch_id`) REFERENCES `branches`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `login` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO `login`(username, password) VALUES
('shorn@gmail.com', 'admin'),
('user1@gmail.com', 'password1'),
('user2@gmail.com', 'password');


INSERT INTO `admin` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) 
VALUES 
(1, 'Sharon', 'T', 'shorn@gmail.com', 'admin', 1, 1, '2024-03-04 08:00:00');



CREATE TABLE `branches` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `branch_code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `street` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `branches` (`id`, `branch_code`, `name`, `street`, `city`, `state`, `country`, `zip_code`, `contact`, `date_created`) VALUES
(1, 'ABC123', 'Farmers Cooperative Warehouse', '123 Main Street', 'Anytown', 'Anystate', 'United States', '12345', '555-123-4567', '2024-03-02 10:00:00'),
(2, 'DEF456', 'Green Fields Distribution Center', '456 Elm Avenue', 'Otherville', 'Otherstate', 'United States', '67890', '555-987-6543', '2024-03-02 11:00:00'),
(3, 'GHI789', 'Organic Produce Depot', '789 Oak Street', 'Farmville', 'Farmstate', 'United States', '54321', '555-222-3333', '2024-03-02 12:00:00');



CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `farmer_name` text NOT NULL,
  `farmer_address` text NOT NULL,
  `farmer_contact` text NOT NULL,
  `buyer_name` text NOT NULL,
  `buyer_address` text NOT NULL,
  `buyer_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Sale, 2=Purchase',
  `from_location` varchar(100) NOT NULL,
  `to_location` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `price_per_unit` float NOT NULL,
  `total_price` float NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `products` (`id`, `reference_number`, `farmer_name`, `farmer_address`, `farmer_contact`, `buyer_name`, `buyer_address`, `buyer_contact`, `type`, `from_location`, `to_location`, `quantity`, `unit`, `price_per_unit`, `total_price`, `status`, `date_created`) VALUES
(1, '20240302001', 'John Doe', 'Farm Address 1', '+123456789', 'Agro Traders', 'Trader Address 1', '+987654321', 1, 'Farm Location A', 'Market A', '500kg', 'Kilograms', 10.50, 5250.00, 0, '2024-03-02 10:00:00'),
(2, '20240302002', 'Jane Smith', 'Farm Address 2', '+987654321', 'Fresh Mart', 'Retail Store Address', '+123456789', 1, 'Farm Location B', 'Retail Store Location', '300 units', 'Units', 2.75, 825.00, 0, '2024-03-02 11:30:00'),
(3, '20240302003', 'Alice Johnson', 'Farm Address 3', '+555555555', 'Green Grocers', 'Wholesale Market Address', '+999999999', 2, 'Farm Location C', 'Wholesale Market Location', '1000 bundles', 'Bundles', 15.25, 15250.00, 0, '2024-03-02 13:45:00');


CREATE TABLE `product_tracks` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `product_tracks` (`id`, `product_id`, `status`, `date_created`) VALUES
(1, 1, 1, '2024-03-02 10:00:00'),
(2, 1, 2, '2024-03-02 11:00:00'),
(3, 2, 1, '2024-03-02 12:00:00'),
(4, 2, 2, '2024-03-02 13:00:00'),
(5, 2, 3, '2024-03-02 14:00:00'),
(6, 3, 1, '2024-03-02 15:00:00');



CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Delivery System', 'delivery@example.com', '+254712345678', '123 Mombasa Road, Nairobi, Kenya', ''),
(2, 'AgriSys', 'agrisys@example.com', '+254723456789', '456 Kisumu Street, Kisumu, Kenya', ''),
(3, 'Farm System', 'farm@example.com', '+254734567890', '789 Eldoret Avenue, Eldoret, Kenya', ''),
(4, 'Product Management', 'management@example.com', '+254745678901', '101 Nakuru Street, Nakuru, Kenya', '');



CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1, 'Sharon', 'T', 'shorn@gmail.com', 'admin', 2, 3, '2024-02-06 08:45:12' ),
(2, 'John', 'Doe', 'john.doe@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, 3, '2024-02-15 09:12:45'),
(3, 'Alice', 'Smith', 'alice.smith@example.com', '202cb962ac59075b964b07152d234b70', 2, 4, '2024-01-20 14:27:18'),
(8, 'David', 'Johnson', 'david.johnson@example.com', 'c4ca4238a0b923820dcc509a6f75849b', 2, 7, '2024-02-04 08:15:29'),
(9, 'Emily', 'Brown', 'emily.brown@example.com', 'c81e728d9d4c2f636f067f89cc14862c', 2, 8, '2024-01-05 11:23:57'),
(10, 'Michael', 'Wilson', 'michael.wilson@example.com', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 2, 9, '2024-0-06 15:40:10');


ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `product_tracks`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `branches`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;


ALTER TABLE `product_tracks`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;


