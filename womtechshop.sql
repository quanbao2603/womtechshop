
            _       ______  __  _________          __  
            | |     / / __ \/  |/  /_  __/__  _____/ /_ 
            | | /| / / / / / /|_/ / / / / _ \/ ___/ __ \
            | |/ |/ / /_/ / /  / / / / /  __/ /__/ / / /
            |__/|__/\____/_/  /_/ /_/  \___/\___/_/ /_/ 
                                            

   ______                           __          ______      __    __   
  / ____/__  ____  ___  _________ _/ /____     /_  __/___ _/ /_  / /__ 
 / / __/ _ \/ __ \/ _ \/ ___/ __ `/ __/ _ \     / / / __ `/ __ \/ / _ \
/ /_/ /  __/ / / /  __/ /  / /_/ / /_/  __/    / / / /_/ / /_/ / /  __/
\____/\___/_/ /_/\___/_/   \__,_/\__/\___/    /_/  \__,_/_.___/_/\___/ 

CREATE DATABASE womtechshop
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `role` (
	`roleID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`rolename` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`description` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`roleID`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `category` (
	`categoryID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`categoryID`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `brand` (
	`brandID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`brandID`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `location` (
	`locationID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`locationID`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `subcategory` (
	`subcategoryID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`categoryID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`subcategoryID`) USING BTREE,
	INDEX `categoryID` (`categoryID`) USING BTREE,
	CONSTRAINT `FK_subcategory_category` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `users` (
	`usersID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`roleID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`username` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`password` VARCHAR(250) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`email` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`create_at` DATE NULL DEFAULT NULL,
	`update_at` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`usersID`) USING BTREE,
	INDEX `roleID` (`roleID`) USING BTREE,
	CONSTRAINT `FK_users_role` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `product` (
	`productID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`subcategoryID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`brandID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`thumbnail` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`price` DECIMAL(10,2) NULL DEFAULT NULL,
	`discount_price` DECIMAL(10,2) NULL DEFAULT NULL,
	`description` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`create_at` DATE NULL DEFAULT NULL,
	`update_at` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`productID`) USING BTREE,
	INDEX `subcategoryID` (`subcategoryID`) USING BTREE,
	INDEX `brandID` (`brandID`) USING BTREE,
	CONSTRAINT `FK_product_brand` FOREIGN KEY (`brandID`) REFERENCES `brand` (`brandID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_product_subcategory` FOREIGN KEY (`subcategoryID`) REFERENCES `subcategory` (`subcategoryID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `address` (
	`addressID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`usersID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`fullname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`phone` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`street` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`ward` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`district` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`city` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`default` TINYINT NULL DEFAULT NULL,
	`create_at` DATE NULL DEFAULT NULL,
	`update_at` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`addressID`) USING BTREE,
	INDEX `usersID` (`usersID`) USING BTREE,
	CONSTRAINT `FK_address_users` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `voucher` (
	`voucherID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`usersID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`code` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`discount_percent` DECIMAL(5,2) NULL DEFAULT NULL,
	`min_order_value` DECIMAL(10,2) NULL DEFAULT NULL,
	`expiry_date` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`voucherID`) USING BTREE,
	INDEX `usersID` (`usersID`) USING BTREE,
	CONSTRAINT `FK_voucher_users` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `specification` (
	`specificationID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`productID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`value` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`specificationID`) USING BTREE,
	INDEX `productID` (`productID`) USING BTREE,
	CONSTRAINT `FK_specification_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `inventory` (
	`inventoryID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`productID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`locationID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`quantity` INT NULL DEFAULT NULL,
	`update_at` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`inventoryID`) USING BTREE,
	INDEX `productID` (`productID`) USING BTREE,
	INDEX `locationID` (`locationID`) USING BTREE,
	CONSTRAINT `FK_inventory_location` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_inventory_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `cart` (
	`cartID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`usersID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`create_at` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`cartID`) USING BTREE,
	INDEX `usersID` (`usersID`) USING BTREE,
	CONSTRAINT `FK_cart_users` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `cart_items` (
	`cart_itemsID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`cartID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`productID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`quantity` INT NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`cart_itemsID`) USING BTREE,
	INDEX `cartID` (`cartID`) USING BTREE,
	INDEX `productID` (`productID`) USING BTREE,
	CONSTRAINT `FK_cart_items_cart` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_cart_items_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `orders` (
	`ordersID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`usersID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`addressID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`order_date` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	`total_price` DECIMAL(10,2) NULL DEFAULT NULL,
	`payment_method` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`payment_status` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`create_at` DATE NULL DEFAULT NULL,
	`update_at` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`ordersID`) USING BTREE,
	INDEX `usersID` (`usersID`) USING BTREE,
	INDEX `addressID` (`addressID`) USING BTREE,
	CONSTRAINT `FK_orders_address` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_orders_users` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `orders_items` (
	`orders_itemsID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`ordersID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`productID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`quantity` INT NULL DEFAULT NULL,
	`price` DECIMAL(10,2) NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`orders_itemsID`) USING BTREE,
	INDEX `ordersID` (`ordersID`) USING BTREE,
	INDEX `productID` (`productID`) USING BTREE,
	CONSTRAINT `FK_orders_items_orders` FOREIGN KEY (`ordersID`) REFERENCES `orders` (`ordersID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_orders_items_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `review` (
	`reviewID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`productID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`usersID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`rating` INT NULL DEFAULT NULL,
	`comment` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`create_at` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`reviewID`) USING BTREE,
	INDEX `productID` (`productID`) USING BTREE,
	INDEX `usersID` (`usersID`) USING BTREE,
	CONSTRAINT `FK_review_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_review_users` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `chat` (
	`chatID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`usersID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`supportID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`create_at` DATE NULL DEFAULT NULL,
	`status` TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`chatID`) USING BTREE,
	INDEX `usersID` (`usersID`) USING BTREE,
	INDEX `supportID` (`supportID`) USING BTREE,
	CONSTRAINT `FK_chat_support` FOREIGN KEY (`supportID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_chat_users` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE `chat_messages` (
	`chat_messagesID` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`chatID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`senderID` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`message` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`send_time` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`chat_messagesID`) USING BTREE,
	INDEX `chatID` (`chatID`) USING BTREE,
	INDEX `senderID` (`senderID`) USING BTREE,
	CONSTRAINT `FK_chat_messages_chat` FOREIGN KEY (`chatID`) REFERENCES `chat` (`chatID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_chat_messages_sender` FOREIGN KEY (`senderID`) REFERENCES `users` (`usersID`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;