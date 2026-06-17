CREATE DATABASE farmbd;
USE farmbd;
-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    role ENUM('SELLER', 'BUYER') NOT NULL,
    full_name VARCHAR(100)
);

-- Crops Table
CREATE TABLE crops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    quantity DOUBLE NOT NULL,
    price_per_unit DOUBLE NOT NULL,
    seller_id INT,
    status ENUM('AVAILABLE', 'SOLD') DEFAULT 'AVAILABLE',
    posted_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (seller_id) REFERENCES users(id)
);

-- Transactions Table
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    crop_id INT,
    buyer_id INT,
    seller_id INT,
    quantity DOUBLE,
    total_amount DOUBLE,
    transaction_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (crop_id) REFERENCES crops(id),
    FOREIGN KEY (buyer_id) REFERENCES users(id),
    FOREIGN KEY (seller_id) REFERENCES users(id)
);