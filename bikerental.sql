-- Create database
CREATE DATABASE ebike_reservation_system;

-- Use the created database
USE ebike_reservation_system;

-- Create users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create bikes table
CREATE TABLE bikes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    status ENUM('Available', 'Not Available', 'Reserved') DEFAULT 'Available',
    rate DECIMAL(5, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create reservations table
CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bike_id INT NOT NULL,
    reserved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (bike_id) REFERENCES bikes(id)
);

-- Insert sample data into bikes table
INSERT INTO bikes (model, status, rate) VALUES
('BC-A498', 'Available', 3.00),
('BC-A499', 'Not Available', 3.00),
('BC-A500', 'Reserved', 3.00),
('BC-A504', 'Available', 3.00);
