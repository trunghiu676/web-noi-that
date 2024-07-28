DROP TABLE IF EXISTS order_details, discount_products, image_products, comments, orders, discounts, news, carts, accounts, contact_messages, products, categories, images;


--
-- Database: `project_sem4`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `isDelete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `ratingStar` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `accountId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `accountId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_products`
--

CREATE TABLE `discount_products` (
  `id` int(11) NOT NULL,
  `discountId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `discountPrice` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_products`
--

CREATE TABLE `image_products` (
  `productId` int(11) NOT NULL,
  `imageId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255),
  `path` varchar(255),
  `accountId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `accountId` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `shippingAddress` varchar(500) NOT NULL,
  `shippingPhone` varchar(255) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `paymentStatus` tinyint(1) NOT NULL,
  `paymentGateway` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL, 
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL, 
  `content` longtext NOT NULL, 
  `price` decimal(18,2) NOT NULL,
  `stock` int(11) NOT NULL, 
  `isDelete` tinyint(1) NOT NULL,
  `isProposal` tinyint(1) NOT NULL, 
  `size` varchar(255) NOT NULL,
  `material` varchar(255) NOT NULL, 
  `path` varchar(255) DEFAULT NULL,
  `categoryID` int(11) NOT NULL, 
  `accountId` int(11) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_products`
--
ALTER TABLE `discount_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountId` (`discountId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_products`
--
ALTER TABLE `image_products`
  ADD KEY `productId` (`productId`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_products`
--
ALTER TABLE `discount_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `discount_products`
--
ALTER TABLE `discount_products`
  ADD CONSTRAINT `discount_products_ibfk_1` FOREIGN KEY (`discountId`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `discount_products_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `image_products`
--
ALTER TABLE `image_products`
  ADD CONSTRAINT `image_products_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `image_products_ibfk_2` FOREIGN KEY (`imageId`) REFERENCES `images` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`);
COMMIT;

INSERT INTO `accounts` (`username`, `password`, `fullName`, `email`, `phone`, `address`, `avatar`, `status`, `role`) VALUES
('admin', 'Admin123', 'User One', 'admin@example.com', 123456789, '123 Street, City', 'avatar1.jpg', 1, 1),
('user', 'User123', 'User Two', 'user@example.com', 987654321, '456 Street, City', 'avatar2.jpg', 1, 0),
('user3', 'password3', 'User Three', 'user3@example.com', 111222333, '789 Street, City', 'avatar3.jpg', 1, 0),
('user4', 'password4', 'User Four', 'user4@example.com', 444555666, '321 Street, City', 'avatar4.jpg', 1, 0),
('user5', 'password5', 'User Five', 'user5@example.com', 777888999, '654 Street, City', 'avatar5.jpg', 1, 0),
('user6', 'password6', 'User Six', 'user6@example.com', 999888777, '987 Street, City', 'avatar6.jpg', 1, 0),
('user7', 'password7', 'User Seven', 'user7@example.com', 222333444, '159 Street, City', 'avatar7.jpg', 1, 0),
('user8', 'password8', 'User Eight', 'user8@example.com', 555666777, '357 Street, City', 'avatar8.jpg', 1, 0),
('user9', 'password9', 'User Nine', 'user9@example.com', 888999000, '258 Street, City', 'avatar9.jpg', 1, 0),
('user10', 'password10', 'User Ten', 'user10@example.com', 123123123, '753 Street, City', 'avatar10.jpg', 1, 0),
('user11', 'password11', 'User Eleven', 'user11@example.com', 456456456, '951 Street, City', 'avatar11.jpg', 1, 0),
('user12', 'password12', 'User Twelve', 'user12@example.com', 789789789, '357 Street, City', 'avatar12.jpg', 1, 0),
('user13', 'password13', 'User Thirteen', 'user13@example.com', 987654321, '456 Street, City', 'avatar13.jpg', 1, 0),
('user14', 'password14', 'User Fourteen', 'user14@example.com', 654987321, '654 Street, City', 'avatar14.jpg', 1, 0),
('user15', 'password15', 'User Fifteen', 'user15@example.com', 321654987, '852 Street, City', 'avatar15.jpg', 1, 0);


INSERT INTO `categories` (`name`, `image`, `path`,`isDelete`) VALUES
('Sofa gỗ', 'sofa-go.jpg', 'sofa-go', 0),
('Bàn ăn', 'ban-an.jpg', 'ban-an',0),
('Tủ áo', 'tu-ao.jpg', 'tu-ao',0),
('Giường ngủ', 'giuong-ngu.jpg', 'giuong-ngu', 0),
('Kệ Tivi', 'ke-tivi.jpeg', 'ke-tivi', 0);
-- ('Bàn làm việc', 'desk.jpg', 'ban-lam-viec',0),
-- ('Ghế văn phòng', 'office_chair.jpg', 'ghe-van-phong-go',0);


INSERT INTO `products` (`name`, `code`, `description`, `content`, `price`, `stock`, `isDelete`, `isProposal`, `size`, `material`, `path`, `categoryID`, `accountId`) VALUES
('Bàn ăn gỗ sồi cao cấp', 'BA-1', 'Bàn ăn gỗ sồi cao cấp', 'Bàn ăn gỗ sồi cao cấp là sự lựa chọn tuyệt vời cho không gian bếp của bạn. Với chất liệu gỗ sồi tự nhiên và thiết kế đẹp mắt, bàn này sẽ tạo nên một không gian ấm cúng và sang trọng cho gia đình bạn.', 11000000, 30, 0, 0, 'L180xW90xH75 cm', 'Gỗ sồi', 'ban-an-go-soi-1', 2, 1),
('Bàn ăn gỗ óc chó sang trọng', 'BA-2', 'Bàn ăn gỗ óc chó sang trọng', 'Bàn ăn gỗ óc chó sang trọng là sự kết hợp hoàn hảo giữa chất liệu tự nhiên và thiết kế hiện đại. Với đường nét tinh tế và đẳng cấp, bàn này sẽ làm nổi bật không gian bếp của bạn.', 7000000, 25, 0, 0, 'L200xW100xH80 cm', 'Gỗ óc chó', 'ban-an-go-oc-cho-2', 2, 1),
('Bàn ăn kính hiện đại', 'BA-3', 'Bàn ăn kính hiện đại', 'Bàn ăn kính hiện đại là sự lựa chọn thông minh cho không gian phòng ăn của bạn. Thiết kế tinh tế, chất liệu kính cao cấp và độ bền bỉ, bàn này sẽ là điểm nhấn cho không gian sống của bạn.', 8000000, 20, 0, 0, 'L160xW90xH75 cm', 'Kính', 'ban-an-kinh-hien-dai-3', 2, 1),
('Bàn ăn mặt đá cao cấp', 'BA-4', 'Bàn ăn mặt đá cao cấp', 'Bàn ăn mặt đá cao cấp là sự kết hợp tinh tế giữa vẻ đẹp tự nhiên của đá và sự sang trọng của thiết kế. Với chất liệu cao cấp và đường nét đẹp mắt, bàn này sẽ làm nổi bật không gian ăn của bạn.', 12000000, 15, 0, 0, 'L200xW100xH75 cm', 'Đá tự nhiên', 'ban-an-da-cao-cap-4', 2, 1),
('Bàn ăn gỗ thông đẹp mắt', 'BA-5', 'Bàn ăn gỗ thông đẹp mắt', 'Bàn ăn gỗ thông đẹp mắt là sự lựa chọn hoàn hảo cho không gian phòng ăn của bạn. Với chất liệu gỗ thông tự nhiên và thiết kế đơn giản nhưng sang trọng, bàn này sẽ tạo nên một không gian ấm cúng và đẳng cấp.', 7000000, 25, 0, 0, 'L180xW80xH75 cm', 'Gỗ thông', 'ban-an-go-thong-dep-mat-5', 2, 1),
('Bàn ăn gỗ cao su bền bỉ', 'BA-6', 'Bàn ăn gỗ cao su bền bỉ', 'Bàn ăn gỗ cao su bền bỉ là sự lựa chọn thông minh cho không gian phòng ăn của bạn. Với chất liệu gỗ cao su tự nhiên và thiết kế đơn giản nhưng đẳng cấp, bàn này sẽ làm nổi bật không gian sống của bạn.', 5500000, 35, 0, 0, 'L160xW80xH75 cm', 'Gỗ cao su', 'ban-an-go-cao-su-ben-bi-6', 2, 1),
('Bàn ăn gỗ óc chó cao cấp', 'BA-7', 'Bàn ăn gỗ óc chó cao cấp', 'Bàn ăn gỗ óc chó cao cấp là sự kết hợp hoàn hảo giữa vẻ đẹp tự nhiên và sự sang trọng của thiết kế. Với chất liệu gỗ óc chó tự nhiên và đường nét tinh tế, bàn này sẽ làm cho không gian phòng ăn của bạn trở nên ấn tượng.', 9000000, 20, 0, 0, 'L180xW90xH75 cm', 'Gỗ óc chó', 'ban-an-go-oc-cho-7', 2, 1),
('Bàn ăn kính độc đáo', 'BA-8', 'Bàn ăn kính độc đáo', 'Bàn ăn kính độc đáo là sự kết hợp hoàn hảo giữa vẻ đẹp hiện đại và sự sang trọng của thiết kế. Với chất liệu kính cao cấp và đường nét tinh tế, bàn này sẽ làm nổi bật không gian phòng ăn của bạn.', 95000000, 18, 0, 0, 'L160xW80xH75 cm', 'Kính', 'ban-an-kinh-doc-dao-8', 2, 1),
('Bàn ăn gỗ tràm bền bỉ', 'BA-9', 'Bàn ăn gỗ tràm bền bỉ', 'Bàn ăn gỗ tràm bền bỉ là sự lựa chọn hoàn hảo cho không gian phòng ăn của bạn. Với chất liệu gỗ tràm tự nhiên và thiết kế đơn giản nhưng đẳng cấp, bàn này sẽ tạo nên một không gian ấm cúng và sang trọng.', 7500000, 22, 0, 0, 'L180xW90xH75 cm', 'Gỗ tràm', 'ban-an-go-tram-ben-bi-9', 2, 1),
('Giường ngủ gỗ tự nhiên sang trọng', 'GN-1', 'Giường ngủ gỗ tự nhiên sang trọng', 'Giường ngủ gỗ tự nhiên sang trọng là lựa chọn hoàn hảo cho không gian phòng ngủ của bạn. Với chất liệu gỗ tự nhiên cao cấp và thiết kế hiện đại, giường này sẽ mang lại sự thoải mái và đẳng cấp cho giấc ngủ của bạn.', 12000000, 25, 0, 0, 'L200xW160xH50 cm', 'Gỗ tự nhiên', 'giuong-ngu-go-1', 4, 1),
('Giường ngủ gỗ thông đơn giản', 'GN-2', 'Giường ngủ gỗ thông đơn giản', 'Giường ngủ gỗ thông đơn giản là sự lựa chọn phổ biến và thông minh cho không gian phòng ngủ của bạn. Với chất liệu gỗ thông tự nhiên và thiết kế đơn giản, giường này sẽ mang lại sự thoải mái và tiện nghi cho giấc ngủ của bạn.', 8000000, 30, 0, 0, 'L180xW140xH50 cm', 'Gỗ thông', 'giuong-ngu-go-thong-2', 4, 1),
('Giường ngủ đệm bông ép êm ái', 'GN-3', 'Giường ngủ đệm bông ép êm ái', 'Giường ngủ đệm bông ép êm ái là sự kết hợp hoàn hảo giữa sự thoải mái và đẳng cấp. Với lớp đệm bông ép êm ái và thiết kế hiện đại, giường này sẽ mang lại giấc ngủ ngon và sâu cho bạn.', 15000000, 20, 0, 0, 'L200xW180xH60 cm', 'Đệm bông ép', 'giuong-ngu-dem-bong-ep-3', 4, 1),
('Giường ngủ gỗ cao su tự nhiên', 'GN-4', 'Giường ngủ gỗ cao su tự nhiên', 'Giường ngủ gỗ cao su tự nhiên là lựa chọn bền vững và an toàn cho không gian phòng ngủ của bạn. Với chất liệu gỗ cao su tự nhiên và thiết kế đơn giản, giường này sẽ là điểm nhấn cho căn phòng của bạn.', 10000000, 35, 0, 0, 'L190xW160xH55 cm', 'Gỗ cao su', 'giuong-ngu-go-cao-su-4', 4, 1),
('Giường ngủ mạ vàng sang trọng', 'GN-5', 'Giường ngủ mạ vàng sang trọng', 'Giường ngủ mạ vàng sang trọng là sự kết hợp hoàn hảo giữa vẻ đẹp và sự sang trọng. Với lớp mạ vàng và thiết kế tinh tế, giường này sẽ làm nổi bật không gian phòng ngủ của bạn.', 20000000, 15, 0, 0, 'L200xW180xH50 cm', 'Kim loại', 'giuong-ngu-ma-vang-5', 4, 1),
('Giường ngủ gỗ óc chó cao cấp', 'GN-6', 'Giường ngủ gỗ óc chó cao cấp', 'Giường ngủ gỗ óc chó cao cấp là sự kết hợp hoàn hảo giữa vẻ đẹp tự nhiên và sự sang trọng của thiết kế. Với chất liệu gỗ óc chó tự nhiên và đường nét tinh tế, giường này sẽ là điểm nhấn cho không gian phòng ngủ của bạn.', 18000000, 20, 0, 0, 'L210xW160xH45 cm', 'Gỗ óc chó', 'giuong-ngu-go-oc-cho-6', 4, 1),
('Giường ngủ gỗ xoan đào cổ điển', 'GN-7', 'Giường ngủ gỗ xoan đào cổ điển', 'Giường ngủ gỗ xoan đào cổ điển là sự kết hợp hoàn hảo giữa vẻ đẹp cổ điển và sự sang trọng của thiết kế. Với chất liệu gỗ xoan đào tự nhiên và đường nét tinh tế, giường này sẽ làm nổi bật không gian phòng ngủ của bạn.', 22000000, 12, 0, 0, 'L200xW180xH50 cm', 'Gỗ xoan đào', 'giuong-ngu-go-xoan-dao-7', 4, 1),
('Kệ TV gỗ thông hiện đại', 'KT-1', 'Kệ TV gỗ thông hiện đại', 'Kệ TV gỗ thông hiện đại là sự lựa chọn thông minh và đẳng cấp cho không gian phòng khách của bạn. Với chất liệu gỗ thông tự nhiên và thiết kế hiện đại, kệ này sẽ làm nổi bật không gian sống của bạn.', 6000000, 40, 0, 0, 'L180xW40xH50 cm', 'Gỗ thông', 'ke-tv-go-thong-hien-dai-1', 5, 1),
('Kệ TV gỗ óc chó sang trọng', 'KT-2', 'Kệ TV gỗ óc chó sang trọng', 'Kệ TV gỗ óc chó sang trọng là sự kết hợp hoàn hảo giữa vẻ đẹp tự nhiên và sự sang trọng của thiết kế. Với chất liệu gỗ óc chó tự nhiên và đường nét tinh tế, kệ này sẽ là điểm nhấn cho không gian phòng khách của bạn.', 9000000, 25, 0, 0, 'L200xW50xH60 cm', 'Gỗ óc chó', 'ke-tv-go-oc-cho-2', 5, 1),
('Kệ TV gỗ cao su tự nhiên', 'KT-3', 'Kệ TV gỗ cao su tự nhiên', 'Kệ TV gỗ cao su tự nhiên là lựa chọn bền vững và an toàn cho không gian phòng khách của bạn. Với chất liệu gỗ cao su tự nhiên và thiết kế đơn giản nhưng đẳng cấp, kệ này sẽ là điểm nhấn cho không gian sống của bạn.', 7500000, 35, 0, 0, 'L160xW40xH50 cm', 'Gỗ cao su', 'ke-tv-go-cao-su-3', 5, 1),
('Kệ TV mặt đá đẹp mắt', 'KT-4', 'Kệ TV mặt đá đẹp mắt', 'Kệ TV mặt đá đẹp mắt là sự kết hợp tinh tế giữa vẻ đẹp tự nhiên của đá và sự hiện đại của thiết kế. Với chất liệu đá tự nhiên và đường nét sang trọng, kệ này sẽ tạo nên một không gian sống đẳng cấp.', 11000000, 20, 0, 0, 'L180xW45xH55 cm', 'Đá tự nhiên', 'ke-tv-da-dep-mat-4', 5, 1),
('Kệ TV gỗ xoan đào cổ điển', 'KT-5', 'Kệ TV gỗ xoan đào cổ điển', 'Kệ TV gỗ xoan đào cổ điển là sự kết hợp hoàn hảo giữa vẻ đẹp cổ điển và sự sang trọng của thiết kế. Với chất liệu gỗ xoan đào tự nhiên và đường nét tinh tế, kệ này sẽ làm nổi bật không gian sống của bạn.', 8500000, 30, 0, 0, 'L190xW50xH60 cm', 'Gỗ xoan đào', 'ke-tv-go-xoan-dao-5', 5, 1),
('Kệ TV gỗ ash hiện đại', 'KT-6', 'Kệ TV gỗ ash hiện đại', 'Kệ TV gỗ ash hiện đại là lựa chọn hoàn hảo cho không gian phòng khách của bạn. Với chất liệu gỗ ash tự nhiên và thiết kế đơn giản nhưng đẳng cấp, kệ này sẽ tạo nên một không gian sống hiện đại và tiện nghi.', 7000000, 40, 0, 0, 'L170xW40xH50 cm', 'Gỗ ash', 'ke-tv-go-ash-hien-dai-6', 5, 1),
('Kệ TV gỗ tràm cổ điển', 'KT-7', 'Kệ TV gỗ tràm cổ điển', 'Kệ TV gỗ tràm cổ điển là sự kết hợp tinh tế giữa vẻ đẹp cổ điển và sự sang trọng của thiết kế. Với chất liệu gỗ tràm tự nhiên và đường nét tinh tế, kệ này sẽ làm nổi bật không gian sống của bạn.', 95000000, 28, 0, 0, 'L200xW45xH55 cm', 'Gỗ tràm', 'ke-tv-go-tram-co-dien-7', 5, 1),
('Kệ TV gỗ hồng lão cao cấp', 'KT-8', 'Kệ TV gỗ hồng lão cao cấp', 'Kệ TV gỗ hồng lão cao cấp là sự lựa chọn độc đáo và sang trọng cho không gian phòng khách của bạn. Với chất liệu gỗ hồng lão tự nhiên và thiết kế đẳng cấp, kệ này sẽ làm nổi bật không gian sống của bạn.', 12000000, 22, 0, 0, 'L190xW50xH60 cm', 'Gỗ hồng lão', 'ke-tv-go-hong-lao-cao-cap-8', 5, 1),
('Kệ TV gỗ lim tự nhiên', 'KT-9', 'Kệ TV gỗ lim tự nhiên', 'Kệ TV gỗ lim tự nhiên là sự lựa chọn hoàn hảo cho không gian phòng khách của bạn. Với chất liệu gỗ lim tự nhiên và thiết kế đơn giản nhưng đẳng cấp, kệ này sẽ tạo nên một không gian sống ấm cúng và sang trọng.', 85000000, 35, 0, 0, 'L180xW40xH50 cm', 'Gỗ lim', 'ke-tv-go-lim-tu-nhien-9', 5, 1),
('Tủ quần áo gỗ tự nhiên đẹp mắt', 'TA-1', 'Tủ quần áo gỗ tự nhiên đẹp mắt', 'Tủ quần áo gỗ tự nhiên đẹp mắt là lựa chọn hoàn hảo cho không gian phòng ngủ của bạn. Với chất liệu gỗ tự nhiên và thiết kế đẹp mắt, tủ này không chỉ đẹp mắt mà còn rất tiện ích.', 9000000, 30, 0, 0, 'L200xW160xH200 cm', 'Gỗ tự nhiên', 'tu-quan-ao-go-tu-nhien-dep-mat-1', 3, 1),
('Tủ quần áo gỗ sồi cao cấp', 'TA-2', 'Tủ quần áo gỗ sồi cao cấp', 'Tủ quần áo gỗ sồi cao cấp là sự lựa chọn đẳng cấp cho không gian phòng ngủ của bạn. Với chất liệu gỗ sồi tự nhiên và thiết kế sang trọng, tủ này sẽ làm nổi bật không gian phòng ngủ của bạn.', 12000000, 25, 0, 0, 'L180xW120xH200 cm', 'Gỗ sồi', 'tu-quan-ao-go-soi-cao-cap-2', 3, 1),
('Tủ quần áo gỗ thông cao cấp', 'TA-3', 'Tủ quần áo gỗ thông cao cấp', 'Tủ quần áo gỗ thông cao cấp là sự lựa chọn hoàn hảo cho không gian phòng ngủ của bạn. Với chất liệu gỗ thông tự nhiên và thiết kế đẹp mắt, tủ này sẽ tạo nên một không gian sống ấm áp và sang trọng.', 95000000, 20, 0, 0, 'L200xW140xH200 cm', 'Gỗ thông', 'tu-quan-ao-go-thong-cao-cap-3', 3, 1),
('Tủ quần áo gỗ xoan đào cổ điển', 'TA-4', 'Tủ quần áo gỗ xoan đào cổ điển', 'Tủ quần áo gỗ xoan đào cổ điển là sự kết hợp tinh tế giữa vẻ đẹp cổ điển và sự sang trọng của thiết kế. Với chất liệu gỗ xoan đào tự nhiên và đường nét tinh tế, tủ này sẽ làm nổi bật không gian phòng ngủ của bạn.', 15000000, 15, 0, 0, 'L190xW160xH200 cm', 'Gỗ xoan đào', 'tu-quan-ao-go-xoan-dao-co-dien-4', 3, 1),
('Tủ quần áo gỗ hồng lão đẳng cấp', 'TA-5', 'Tủ quần áo gỗ hồng lão đẳng cấp', 'Tủ quần áo gỗ hồng lão đẳng cấp là sự lựa chọn hoàn hảo cho không gian phòng ngủ của bạn. Với chất liệu gỗ hồng lão tự nhiên và thiết kế sang trọng, tủ này sẽ tạo nên một không gian sống đẳng cấp và sang trọng.', 18000000, 18, 0, 0, 'L200xW160xH200 cm', 'Gỗ hồng lão', 'tu-quan-ao-go-hong-lao-dang-cap-5', 3, 1),
('Tủ quần áo gỗ lim tự nhiên hiện đại', 'TA-6', 'Tủ quần áo gỗ lim tự nhiên hiện đại', 'Tủ quần áo gỗ lim tự nhiên hiện đại là lựa chọn thông minh và tiện ích cho không gian phòng ngủ của bạn. Với chất liệu gỗ lim tự nhiên và thiết kế hiện đại, tủ này sẽ mang lại không gian sống hiện đại và sang trọng.', 10000000, 22, 0, 0, 'L180xW120xH200 cm', 'Gỗ lim', 'tu-quan-ao-go-lim-tu-nhien-hien-dai-6', 3, 1),
('Tủ quần áo gỗ tràm tự nhiên sang trọng', 'TA-7', 'Tủ quần áo gỗ tràm tự nhiên sang trọng', 'Tủ quần áo gỗ tràm tự nhiên sang trọng là lựa chọn đẳng cấp cho không gian phòng ngủ của bạn. Với chất liệu gỗ tràm tự nhiên và thiết kế tinh tế, tủ này sẽ tạo nên một không gian sống sang trọng và ấn tượng.', 13000000, 20, 0, 0, 'L200xW140xH200 cm', 'Gỗ tràm', 'tu-quan-ao-go-tram-tu-nhien-sang-trong-7', 3, 1),
('Tủ quần áo gỗ ash đẳng cấp', 'TA-8', 'Tủ quần áo gỗ ash đẳng cấp', 'Tủ quần áo gỗ ash đẳng cấp là sự kết hợp hoàn hảo giữa vẻ đẹp và sự sang trọng. Với chất liệu gỗ ash tự nhiên và thiết kế đẳng cấp, tủ này sẽ làm nổi bật không gian phòng ngủ của bạn.', 16000000, 25, 0, 0, 'L190xW150xH200 cm', 'Gỗ ash', 'tu-quan-ao-go-ash-dang-cap-8', 3, 1),
('Sofa góc da cao cấp', 'SF-1', 'Sofa góc da cao cấp', 'Sofa góc da cao cấp là sự kết hợp tinh tế giữa vẻ đẹp và sự thoải mái. Với chất liệu da cao cấp và thiết kế hiện đại, sofa này sẽ là điểm nhấn cho không gian phòng khách của bạn.', 15000000, 50, 0, 0, 'L200xW150xH80 cm', 'Da tổng hợp', 'sofa-goc-cao-cap-1', 1, 1),
('Sofa góc nỉ êm ái', 'SF-2', 'Sofa góc nỉ êm ái', 'Sofa góc nỉ êm ái là lựa chọn hoàn hảo cho không gian phòng khách của bạn. Với chất liệu nỉ mềm mại và thiết kế thoải mái, sofa này sẽ mang lại cảm giác thoải mái và ấm áp cho gia đình bạn.', 12000000, 40, 0, 0, 'L220xW160xH70 cm', 'Nỉ', 'sofa-goc-ni-em-ai-2', 1, 1),
('Sofa góc vải hạt dẻ hiện đại', 'SF-3', 'Sofa góc vải hạt dẻ hiện đại', 'Sofa góc vải hạt dẻ hiện đại là sự kết hợp tinh tế giữa vẻ đẹp và sự thoải mái. Với chất liệu vải hạt dẻ và thiết kế hiện đại, sofa này sẽ là điểm nhấn cho không gian phòng khách của bạn.', 10000000, 45, 0, 0, 'L210xW140xH65 cm', 'Vải', 'sofa-goc-vai-hat-de-hien-dai-3', 1, 1),
('Sofa góc gỗ cao su tự nhiên', 'SF-4', 'Sofa góc gỗ cao su tự nhiên', 'Sofa góc gỗ cao su tự nhiên là lựa chọn bền vững và an toàn cho không gian phòng khách của bạn. Với chất liệu gỗ cao su tự nhiên và thiết kế đẹp mắt, sofa này sẽ làm nổi bật không gian sống của bạn.', 18000000, 35, 0, 0, 'L200xW180xH70 cm', 'Gỗ cao su', 'sofa-goc-go-cao-su-tu-nhien-4', 1, 1),
('Sofa góc chất liệu kim loại', 'SF-5', 'Sofa góc chất liệu kim loại', 'Sofa góc chất liệu kim loại là sự kết hợp độc đáo giữa vẻ đẹp và tính tiện ích. Với chất liệu kim loại bền bỉ và thiết kế hiện đại, sofa này sẽ làm nổi bật không gian phòng khách của bạn.', 2000000, 30, 0, 0, 'L220xW160xH70 cm', 'Kim loại', 'sofa-goc-chat-lieu-kim-loai-5', 1, 1),
('Sofa góc gỗ óc chó hiện đại', 'SF-6', 'Sofa góc gỗ óc chó hiện đại', 'Sofa góc gỗ óc chó hiện đại là sự kết hợp tinh tế giữa vẻ đẹp tự nhiên và sự hiện đại của thiết kế. Với chất liệu gỗ óc chó tự nhiên và đường nét tinh tế, sofa này sẽ là điểm nhấn cho không gian phòng khách của bạn.', 22000000, 25, 0, 0, 'L210xW160xH65 cm', 'Gỗ óc chó', 'sofa-goc-go-oc-cho-hien-dai-6', 1, 1),
('Sofa góc gỗ xoan đào cổ điển', 'SF-7', 'Sofa góc gỗ xoan đào cổ điển', 'Sofa góc gỗ xoan đào cổ điển là sự kết hợp hoàn hảo giữa vẻ đẹp cổ điển và sự sang trọng của thiết kế. Với chất liệu gỗ xoan đào tự nhiên và đường nét tinh tế, sofa này sẽ là điểm nhấn cho không gian phòng khách của bạn.', 25000000, 20, 0, 0, 'L220xW180xH70 cm', 'Gỗ xoan đào', 'sofa-goc-go-xoan-dao-co-dien-7', 1, 1),
('Sofa góc gỗ ash hiện đại', 'SF-8', 'Sofa góc gỗ ash hiện đại', 'Sofa góc gỗ ash hiện đại là sự kết hợp hoàn hảo giữa vẻ đẹp tự nhiên và sự hiện đại của thiết kế. Với chất liệu gỗ ash tự nhiên và đường nét tinh tế, sofa này sẽ là điểm nhấn cho không gian phòng khách của bạn.', 23000000, 28, 0, 0, 'L210xW150xH70 cm', 'Gỗ ash', 'sofa-goc-go-ash-hien-dai-8', 1, 1),
('Sofa góc gỗ hồng lão sang trọng', 'SF-9', 'Sofa góc gỗ hồng lão sang trọng', 'Sofa góc gỗ hồng lão sang trọng là sự kết hợp hoàn hảo giữa vẻ đẹp cổ điển và sự sang trọng của thiết kế. Với chất liệu gỗ hồng lão tự nhiên và đường nét tinh tế, sofa này sẽ là điểm nhấn cho không gian phòng khách của bạn.', 27000000, 15, 0, 0, 'L220xW160xH70 cm', 'Gỗ hồng lão', 'sofa-goc-go-hong-lao-sang-trong-9', 1, 1);

INSERT INTO `images` (`path`) VALUES
('image1.jpg'),
('image2.jpg'),
('image3.jpg'),
('image4.jpg'),
('image5.jpg'),
('image6.jpg'),
('image7.jpg'),
('image8.jpg'),
('image9.jpg'),
('image10.jpg'),
('image11.jpg'),
('image12.jpg'),
('image13.jpg'),
('image14.jpg'),
('image15.jpg'),
('image16.jpg'),
('image17.jpg'),
('image18.jpg'),
('image19.jpg'),
('image20.jpg'),
('image21.jpg'),
('image22.jpg'),
('image23.jpg'),
('image24.jpg'),
('image25.jpg'),
('image26.jpg'),
('image27.jpg'),
('image28.jpg'),
('image29.jpg'),
('image30.jpg'),
('image31.jpg'),
('image32.jpg'),
('image33.jpg'),
('image34.jpg'),
('image35.jpg'),
('image36.jpg'),
('image37.jpg'),
('image38.jpg'),
('image39.jpg'),
('image40.jpg'),
('image41.jpg'),
('image42.jpg'),
('image43.jpg'),
('image44.jpg'),
('image45.jpg'),
('image46.jpg'),
('image47.jpg'),
('image48.jpg'),
('image49.jpg'),
('image50.jpg'),
('image51.jpg'),
('image52.jpg'),
('image53.jpg'),
('image54.jpg'),
('image55.jpg'),
('image56.jpg'),
('image57.jpg'),
('image58.jpg'),
('image59.jpg'),
('image60.jpg'),
('image61.jpg'),
('image62.jpg'),
('image63.jpg'),
('image64.jpg'),
('image65.jpg'),
('image66.jpg'),
('image67.jpg'),
('image68.jpg'),
('image69.jpg'),
('image70.jpg'),
('image71.jpg'),
('image72.jpg'),
('image73.jpg'),
('image74.jpg'),
('image75.jpg'),
('image76.jpg'),
('image77.jpg'),
('image78.jpg'),
('image79.jpg'),
('image80.jpg'),
('image81.jpg'),
('image82.jpg'),
('image83.jpg'),
('image84.jpg'),
('image85.jpg'),
('image86.jpg'),
('image87.jpg'),
('image88.jpg'),
('image89.jpg'),
('image90.jpg'),
('image91.jpg'),
('image92.jpg'),
('image93.jpg'),
('image94.jpg'),
('image95.jpg'),
('image96.jpg'),
('image97.jpg'),
('image98.jpeg'),
('image99.jpeg'),
('image100.jpeg'),
('image101.jpeg'),
('image102.jpeg'),
('image103.jpeg'),
('image104.jpeg'),
('image105.jpeg'),
('image106.jpeg'),
('image107.jpeg'),
('image108.jpeg'),
('image109.jpeg'),
('image110.jpeg'),
('image111.jpeg'),
('image112.jpeg'),
('image113.jpeg'),
('image114.jpeg'),
('image115.jpeg'),
('image116.jpeg'),
('image117.jpeg'),
('image118.jpeg'),
('image119.jpeg'),
('image120.jpeg'),
('image121.jpeg'),
('image122.jpeg'),
('image123.jpeg'),
('image124.jpeg'),
('image125.jpeg'),
('image126.jpeg'),
('image127.jpeg'),
('image128.jpeg'),
('image129.jpeg'),
('image130.jpeg'),
('image131.jpeg'),
('image132.jpeg'),
('image133.jpeg'),
('image134.jpeg'),
('image135.jpeg'),
('image136.jpeg'),
('image137.jpeg'),
('image138.jpeg'),
('image139.jpeg'),
('image140.jpeg'),
('image141.jpeg'),
('image142.jpeg'),
('image143.jpeg'),
('image144.jpeg'),
('image145.jpeg'),
('image146.jpeg'),
('image147.jpeg'),
('image148.jpeg'),
('image149.png'),
('image150.png'),
('image151.jpeg'),
('image152.jpeg'),
('image153.jpeg'),
('image154.jpeg'),
('image155.jpeg'),
('image156.jpeg'),
('image157.jpeg'),
('image158.jpeg'),
('image159.jpeg'),
('image160.jpeg'),
('image161.jpeg'),
('image162.jpeg'),
('image163.jpeg'),
('image164.jpeg'),
('image165.jpeg'),
('image166.jpeg'),
('image167.jpeg'),
('image168.jpeg'),
('image169.jpeg'),
('image170.jpeg'),
('image171.jpeg'),
('image172.jpg'),
('image173.jpg'),
('image174.jpg'),
('image175.jpg'),
('image176.jpg'),
('image177.jpg'),
('image178.jpg'),
('image179.jpg'),
('image180.jpg'),
('image181.jpg'),
('image182.jpg'),
('image183.jpg'),
('image184.jpg'),
('image185.jpg'),
('image186.jpg'),
('image187.jpg'),
('image188.jpg'),
('image189.jpg'),
('image190.jpg'),
('image191.jpg'),
('image192.jpg'),
('image193.jpg'),
('image194.jpg'),
('image195.jpg'),
('image196.jpg'),
('image197.jpg'),
('image198.jpg'),
('image199.jpg'),
('image200.jpg'),
('image201.jpg'),
('image202.jpg'),
('image203.jpg'),
('image204.jpg'),
('image205.jpg'),
('image206.jpg'),
('image207.jpg'),
('image208.jpg'),
('image209.jpg'),
('image210.jpg'),
('image211.jpg'),
('image212.jpg'),
('image213.jpg'),
('image214.jpg'),
('image215.jpg'),
('image216.jpg'),
('image217.jpg'),
('image218.jpg'),
('image219.jpg'),
('image220.jpg'),
('image221.jpg'),
('image222.jpg'),
('image223.jpg'),
('image224.jpg'),
('image225.jpg'),
('image226.jpg'),
('image227.jpg'),
('image228.jpg'),
('image229.jpg'),
('image230.jpg'),
('image231.jpg'),
('image232.jpg'),
('image233.jpg'),
('image234.jpg'),
('image235.jpg'),
('image236.jpg'),
('image237.jpg'),
('image238.jpg'),
('image239.jpg'),
('image240.jpg'),
('image241.jpg'),
('image242.jpg'),
('image243.jpg'),
('image244.jpg'),
('image245.jpg'),
('image246.jpg'),
('image247.jpg'),
('image248.jpg'),
('image249.jpg'),
('image250.jpg'),
('image251.jpg'),
('image252.jpg'),
('image253.jpg'),
('image254.jpg'),
('image255.jpg'),
('image256.jpg'),
('image257.jpg'),
('image258.jpg'),
('image259.jpg'),
('image260.jpg'),
('image261.jpg'),
('image262.jpg'),
('image263.jpg'),
('image264.jpg'),
('image265.jpg'),
('image266.jpg'),
('image267.jpg'),
('image268.jpg'),
('image269.jpg'),
('image270.jpg'),
('image271.jpg'),
('image272.jpg'),
('image273.jpg'),
('image274.jpg'),
('image275.jpg'),
('image276.jpg'),
('image277.jpg'),
('image278.jpg'),
('image279.jpg'),
('image280.jpg'),
('image281.jpg'),
('image282.jpg'),
('sofa-go.jpg'),
('ban-an.jpg'),
('tu-ao.jpg'),
('giuong-ngu.jpg'),
('ke-tivi.jpeg');


INSERT INTO `image_products` (`productId`, `imageId`, `status`) VALUES
(1, 1, 1),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(2, 7, 1),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 11, 0),
(2, 12, 0),
(3, 13, 1),
(3, 14, 0),
(3, 15, 0),
(3, 16, 0),
(3, 17, 0),
(3, 18, 0),
(3, 19, 0),
(4, 20, 1),
(4, 21, 0),
(4, 22, 0),
(4, 23, 0),
(4, 24, 0),
(4, 25, 0),
(5, 26, 1),
(5, 27, 0),
(5, 28, 0),
(5, 29, 0),
(5, 30, 0),
(5, 31, 0),
(6, 32, 1),
(6, 33, 0),
(6, 34, 0),
(6, 35, 0),
(6, 36, 0),
(6, 37, 0),
(6, 38, 0),
(7, 39, 1),
(7, 40, 0),
(7, 41, 0),
(7, 42, 0),
(7, 43, 0),
(7, 44, 0),
(8, 45, 1),
(8, 46, 0),
(8, 47, 0),
(8, 48, 0),
(8, 49, 0),
(8, 50, 0),
(9, 51, 1),
(9, 52, 0),
(9, 53, 0),
(9, 54, 0),
(9, 55, 0),
(9, 56, 0),
(10, 57, 1),
(10, 58, 0),
(10, 59, 0),
(10, 60, 0),
(10, 61, 0),
(10, 62, 0),
(11, 63, 1),
(11, 64, 0),
(11, 65, 0),
(11, 66, 0),
(11, 67, 0),
(11, 68, 0),
(12, 69, 1),
(12, 70, 0),
(12, 71, 0),
(12, 72, 0),
(12, 73, 0),
(12, 74, 0),
(13, 75, 1),
(13, 76, 0),
(13, 77, 0),
(13, 78, 0),
(13, 79, 0),
(14, 80, 1),
(14, 81, 0),
(14, 82, 0),
(14, 83, 0),
(14, 84, 0),
(14, 85, 0),
(15, 86, 1),
(15, 87, 0),
(15, 88, 0),
(15, 89, 0),
(15, 90, 0),
(15, 91, 0),
(16, 92, 1),
(16, 93, 0),
(16, 94, 0),
(16, 95, 0),
(16, 96, 0),
(16, 97, 0),
(17, 98, 1),
(17, 99, 0),
(17, 100, 0),
(17, 101, 0),
(17, 102, 0),
(17, 103, 0),
(17, 104, 0),
(17, 105, 0),
(18, 106, 1),
(18, 107, 0),
(18, 108, 0),
(18, 109, 0),
(18, 110, 0),
(18, 111, 0),
(19, 112, 1),
(19, 113, 0),
(19, 114, 0),
(19, 115, 0),
(19, 116, 0),
(19, 117, 0),
(19, 118, 0),
(19, 119, 0),
(20, 120, 1),
(20, 121, 0),
(20, 122, 0),
(20, 123, 0),
(20, 124, 0),
(20, 125, 0),
(20, 126, 0),
(20, 127, 0),
(20, 128, 0),
(20, 129, 0),
(20, 130, 0),
(21, 131, 1),
(21, 132, 0),
(21, 133, 0),
(21, 134, 0),
(21, 135, 0),
(21, 136, 0),
(21, 137, 0),
(21, 138, 0),
(21, 139, 0),
(22, 140, 1),
(22, 141, 0),
(22, 142, 0),
(22, 143, 0),
(22, 144, 0),
(22, 145, 0),
(22, 146, 0),
(22, 147, 0),
(22, 148, 0),
(23, 149, 1),
(23, 150, 0),
(23, 151, 0),
(23, 152, 0),
(23, 153, 0),
(23, 154, 0),
(23, 155, 0),
(23, 156, 0),
(23, 157, 0),
(24, 158, 1),
(24, 159, 0),
(24, 160, 0),
(24, 161, 0),
(24, 162, 0),
(24, 163, 0),
(24, 164, 0),
(24, 165, 0),
(24, 166, 0),
(25, 167, 1),
(25, 168, 0),
(25, 169, 0),
(25, 170, 0),
(25, 171, 0),
(26, 172, 1),
(26, 173, 0),
(26, 174, 0),
(26, 175, 0),
(26, 176, 0),
(26, 177, 0),
(27, 178, 1),
(27, 179, 0),
(27, 180, 0),
(27, 181, 0),
(27, 182, 0),
(28, 183, 1),
(28, 184, 0),
(28, 185, 0),
(28, 186, 0),
(28, 187, 0),
(28, 188, 0),
(29, 189, 1),
(29, 190, 0),
(29, 191, 0),
(29, 192, 0),
(29, 193, 0),
(29, 194, 0),
(30, 195, 1),
(30, 196, 0),
(30, 197, 0),
(30, 198, 0),
(30, 199, 0),
(30, 200, 0),
(31, 201, 1),
(31, 202, 0),
(31, 203, 0),
(31, 204, 0),
(31, 205, 0),
(32, 206, 1),
(32, 207, 0),
(32, 208, 0),
(32, 209, 0),
(32, 210, 0),
(32, 211, 0),
(33, 212, 1),
(33, 213, 0),
(33, 214, 0),
(33, 215, 0),
(33, 216, 0),
(33, 217, 0),
(34, 218, 1),
(34, 219, 0),
(34, 220, 0),
(34, 221, 0),
(34, 222, 0),
(34, 223, 0),
(34, 224, 0),
(35, 225, 1),
(35, 226, 0),
(35, 227, 0),
(35, 228, 0),
(35, 229, 0),
(35, 230, 0),
(35, 231, 0),
(36, 232, 1),
(36, 233, 0),
(36, 234, 0),
(36, 235, 0),
(36, 236, 0),
(36, 237, 0),
(36, 238, 0),
(37, 239, 1),
(37, 240, 0),
(37, 241, 0),
(37, 242, 0),
(37, 243, 0),
(37, 244, 0),
(37, 245, 0),
(38, 246, 1),
(38, 247, 0),
(38, 248, 0),
(38, 249, 0),
(38, 250, 0),
(38, 251, 0),
(38, 252, 0),
(39, 253, 1),
(39, 254, 0),
(39, 255, 0),
(39, 256, 0),
(39, 257, 0),
(39, 258, 0),
(39, 259, 0),
(40, 260, 1),
(40, 261, 0),
(40, 262, 0),
(40, 263, 0),
(40, 264, 0),
(40, 265, 0),
(40, 266, 0),
(40, 267, 0),
(41, 268, 1),
(41, 269, 0),
(41, 270, 0),
(41, 271, 0),
(41, 272, 0),
(41, 273, 0),
(41, 274, 0),
(41, 275, 0),
(42, 276, 1),
(42, 277, 0),
(42, 278, 0),
(42, 279, 0),
(42, 280, 0),
(42, 281, 0),
(42, 282, 0);


INSERT INTO `discounts` (`name`, `startDate`, `endDate`, `accountId`) VALUES
('Giảm giá mùa hè', '2024-06-01', '2024-08-31', 1),
('Khuyến mãi cuối năm', '2024-11-01', '2024-12-31', 1),
('Ưu đãi sinh nhật', '2024-03-20', '2024-03-20', 2),
('Giảm giá đặc biệt', '2024-04-01', '2024-04-30', 3),
('Khuyến mãi hấp dẫn', '2024-09-01', '2024-09-30', 4),
('Giảm giá mua sắm', '2024-05-01', '2024-05-31', 5),
('Deal cuối tuần', '2024-03-20', '2024-03-22', 1),
('Ưu đãi đặc biệt', '2024-07-01', '2024-07-07', 2),
('Khuyến mãi lớn nhất năm', '2024-10-01', '2024-10-31', 3),
('Giảm giá Black Friday', '2024-11-27', '2024-11-27', 4);

INSERT INTO `discount_products` (`discountId`, `productId`, `discountPrice`) VALUES
(1, 1, 100),
(1, 2, 50),
(1, 3, 80),
(2, 4, 70),
(2, 5, 60),
(2, 6, 90),
(3, 7, 30),
(3, 8, 40),
(3, 9, 50),
(4, 10, 20),
(4, 11, 30),
(4, 12, 40),
(5, 13, 10),
(5, 14, 20),
(5, 15, 30),
(6, 16, 15),
(6, 17, 25),
(6, 18, 35),
(7, 19, 5),
(7, 20, 15),
(7, 21, 25),
(8, 22, 20),
(8, 23, 30),
(8, 24, 40),
(9, 25, 10),
(9, 26, 20),
(9, 27, 30),
(10, 28, 15),
(10, 29, 25),
(10, 30, 35);



INSERT INTO `orders` (`code`, `accountId`, `orderDate`, `customerName`, `shippingAddress`, `shippingPhone`, `total`, `status`, `paymentStatus`, `paymentGateway`) VALUES
('ORD20240320001', 1, '2024-03-25', 'Nguyen Thi A' , '123 ABC Street, City, Country', '1234567890', 430, 'Đơn hàng mới', 0, 'PayPal'),
('ORD20240320002', 2, '2024-03-27', 'Nguyen Thi B' , '456 XYZ Street, City, Country', '9876543210', 470, 'Chờ xác nhận', 1, 'Stripe'),
('ORD20240320003', 3, '2024-03-29', 'Nguyen Thi C' , '789 DEF Street, City, Country', '4561237890', 250, 'Đang vận chuyển', 1, 'PayPal'),
('ORD20240320004', 4, '2024-03-30', 'Nguyen Thi D' , '321 GHI Street, City, Country', '7894561230', 270, 'Hoàn tất', 0, 'Stripe'),
('ORD20240320005', 5, '2024-04-02', 'Nguyen Thi E' , '654 JKL Street, City, Country', '3216549870', 200, 'Đơn hàng mới', 0, 'PayPal');

INSERT INTO `order_details` (`orderId`, `productId`, `price`, `quantity`, `totalPrice`) VALUES
(1, 1, 100, 2, 200),
(1, 2, 50, 3, 150),
(1, 3, 80, 1, 80),
(2, 4, 70, 2, 140),
(2, 5, 60, 1, 60),
(2, 6, 90, 3, 270),
(3, 7, 30, 4, 120),
(3, 8, 40, 2, 80),
(3, 9, 50, 1, 50),
(4, 10, 20, 5, 100),
(4, 11, 30, 3, 90),
(4, 12, 40, 2, 80),
(5, 13, 10, 6, 60),
(5, 14, 20, 4, 80),
(5, 15, 30, 2, 60);


INSERT INTO `comments` (`ratingStar`, `content`, `accountId`, `productId`) VALUES
(2, 'Sản phẩm đẹp và chất lượng tốt!', 2, 1),
(4, 'Giao hàng nhanh và sản phẩm đúng như mô tả.', 3, 1),
(3, 'Sản phẩm không đáng giá so với giá tiền.', 2, 2),
(5, 'Tôi rất hài lòng với sản phẩm này.', 3, 2),
(4, 'Chất lượng sản phẩm tốt, giao hàng nhanh chóng.', 2, 3),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 3, 3),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 2, 4),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 3, 4),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 2, 5),
(5, 'Sản phẩm đẹp và sắc nét.', 3, 5),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 2, 6),
(3, 'Sản phẩm không đáng giá với giá tiền.', 3, 6),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 2, 7),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 3, 7),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 2, 8),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 3, 8),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 2, 9),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 3, 9),
(5, 'Sản phẩm đẹp và sắc nét.', 2, 10),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 3, 10),
(3, 'Sản phẩm không đáng giá với giá tiền.', 2, 11),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 3, 11),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 2, 12),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 3, 12),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 2, 13),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 3, 13),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 2, 14),
(5, 'Sản phẩm đẹp và sắc nét.', 3, 14),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 2, 15),
(3, 'Sản phẩm không đáng giá với giá tiền.', 3, 15),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 2, 16),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 3, 16),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 2, 17),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 3, 17),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 2, 18),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 3, 18),
(5, 'Sản phẩm đẹp và sắc nét.', 2, 19),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 3, 19),
(3, 'Sản phẩm không đáng giá với giá tiền.', 2, 20),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 3, 20),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 2, 21),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 3, 21),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 2, 22),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 3, 22),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 2, 23),
(5, 'Sản phẩm đẹp và sắc nét.', 3, 23),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 2, 24),
(3, 'Sản phẩm không đáng giá với giá tiền.', 3, 24),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 2, 25),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 3, 25),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 2, 26),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 3, 26),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 2, 27),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 3, 27),
(5, 'Sản phẩm đẹp và sắc nét.', 2, 28),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 3, 28),
(3, 'Sản phẩm không đáng giá với giá tiền.', 2, 29),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 3, 29),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 2, 30),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 3, 30),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 2, 31),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 3, 31),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 2, 32),
(5, 'Sản phẩm đẹp và sắc nét.', 3, 32),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 2, 33),
(3, 'Sản phẩm không đáng giá với giá tiền.', 3, 33),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 2, 34),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 3, 34),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 2, 35),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 3, 35),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 2, 36),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 3, 36),
(5, 'Sản phẩm đẹp và sắc nét.', 2, 37),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 3, 37),
(3, 'Sản phẩm không đáng giá với giá tiền.', 2, 38),
(5, 'Rất hài lòng với dịch vụ, sản phẩm đẹp.', 3, 38),
(4, 'Giá cả hợp lý, sản phẩm đúng như mô tả.', 2, 39),
(3, 'Sản phẩm không như mong đợi, nhưng vẫn chấp nhận được.', 3, 39),
(5, 'Dịch vụ tốt, sản phẩm đáng giá tiền.', 2, 40),
(4, 'Sản phẩm như mô tả, giao hàng nhanh.', 3, 40),
(3, 'Giá cả phải chăng, nhưng chất lượng không tốt.', 2, 41),
(5, 'Sản phẩm đẹp và sắc nét.', 3, 41),
(4, 'Giao hàng nhanh chóng, sản phẩm đúng như hình ảnh.', 2, 42),
(3, 'Sản phẩm không đáng giá với giá tiền.', 3, 42);


INSERT INTO `news` (`name`, `image`, `path` , `description`, `content`,`accountId`) VALUES
('Khuyến mãi đặc biệt dịp hè', 'image1.jpg', 'khuyen-mai-dac-biet-dip-he' ,'Cơ hội mua sắm giảm giá lớn chưa từng có!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet nisl lacinia, gravida tortor nec, accumsan ipsum.', 1),
('Ra mắt sản phẩm mới', 'image2.jpg', 'ra-mat-san-pham-moi', 'Khám phá ngay những sản phẩm nội thất đẳng cấp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet nisl lacinia, gravida tortor nec, accumsan ipsum.', 2),
('Tin tức sự kiện', 'image3.jpg', 'tin-tuc-su-kien','Tham gia ngay các sự kiện nội thất hấp dẫn', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet nisl lacinia, gravida tortor nec, accumsan ipsum.', 3),
('Tư vấn trang trí nội thất', 'image4.jpg', 'tu-van-trang-tri-noi-that', 'Những mẹo nhỏ giúp không gian sống trở nên ấn tượng hơn', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet nisl lacinia, gravida tortor nec, accumsan ipsum.', 4),
('Cập nhật xu hướng thiết kế', 'image5.jpg', 'cap-nhat-xu-huong-thiet-ke', 'Đón nhận những xu hướng mới nhất trong ngành trang trí nội thất', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet nisl lacinia, gravida tortor nec, accumsan ipsum.', 5);

INSERT INTO `carts` (`accountId`, `productId`, `quantity`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1);

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `message`) VALUES
(1, 'John Doe', 'john.doe@example.com', 123456789, 'This is a test message 1.'),
(2, 'Jane Smith', 'jane.smith@example.com', 987654320, 'This is a test message 2.'),
(3, 'Alice Johnson', 'alice.johnson@example.com', 555124567, 'This is a test message 3.'),
(4, 'Bob Brown', 'bob.brown@example.com', 999887776, 'This is a test message 4.'),
(5, 'Emily Davis', 'emily.davis@example.com', 111223334, 'This is a test message 5.');

