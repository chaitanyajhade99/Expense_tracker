Create database expense_tracker;
use expense_tracker;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),

    created_at TIMESTAMP default CURRENT_TIMESTAMP,
	updated_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	active_yn INT DEFAULT 1
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    user_id INT,
    description VARCHAR(255),
    icon_url VARCHAR(255),

    transaction_type ENUM('INCOME','EXPENSE') NOT NULL,
    created_at TIMESTAMP default CURRENT_TIMESTAMP,
	updated_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	active_yn INT DEFAULT 1,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);
CREATE TABLE expenses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_id INT NOT NULL,

    description VARCHAR(255),
    notes VARCHAR(500),
    amount DECIMAL(10,2) NOT NULL,
    date_of_transaction DATE NOT NULL,

    created_at TIMESTAMP default CURRENT_TIMESTAMP,
	updated_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	active_yn INT DEFAULT 1,

        FOREIGN KEY (user_id)
        REFERENCES users(id) ON DELETE CASCADE,

        FOREIGN KEY (category_id)
        REFERENCES categories(id) ON DELETE CASCADE
);


INSERT INTO users (name, username, email, password, phone)
VALUES
('Gaurav Lalwani', 'gaurav', 'gaurav@gmail.com', 'pass123', '9876543210'),
('Rushil Ahuja', 'rushil', 'rushil@gmail.com', 'pass123', '9876543211'),
('Diven Mirchandani', 'diven', 'diven@gmail.com', 'pass123', '9876543212'),
('Yash Motwani', 'yash', 'yash@gmail.com', 'pass123', '9876543213'),
('Kavda Hiranandani', 'kavda', 'kavda@gmail.com', 'pass123', '9876543214');


INSERT INTO categories (name, user_id, description, icon_url, transaction_type)
VALUES
-- Gaurav (user_id = 1)
('Food', 1, 'Daily food expenses', 'food.png', 'EXPENSE'),
('Travel', 1, 'Travel & transport', 'travel.png', 'EXPENSE'),
('Electronics', 1, 'Gadgets & accessories', 'electronics.png', 'EXPENSE'),
('Stocks', 1, 'Stock market income', 'stocks.png', 'INCOME'),
('Rent', 1, 'Rental income', 'rent.png', 'INCOME'),

-- Rushil (user_id = 2)
('Food', 2, 'Food expenses', 'food.png', 'EXPENSE'),
('Travel', 2, 'Travel expenses', 'travel.png', 'EXPENSE'),
('Electronics', 2, 'Electronics shopping', 'electronics.png', 'EXPENSE'),
('Stocks', 2, 'Investment returns', 'stocks.png', 'INCOME'),
('Rent', 2, 'House rent income', 'rent.png', 'INCOME'),

-- Diven (user_id = 3)
('Food', 3, 'Food & dining', 'food.png', 'EXPENSE'),
('Travel', 3, 'Travel costs', 'travel.png', 'EXPENSE'),
('Electronics', 3, 'Electronics items', 'electronics.png', 'EXPENSE'),
('Stocks', 3, 'Stock income', 'stocks.png', 'INCOME'),
('Rent', 3, 'Rental income', 'rent.png', 'INCOME'),

-- Yash (user_id = 4)
('Food', 4, 'Eating out', 'food.png', 'EXPENSE'),
('Travel', 4, 'Commute & trips', 'travel.png', 'EXPENSE'),
('Electronics', 4, 'Electronic purchases', 'electronics.png', 'EXPENSE'),
('Stocks', 4, 'Equity income', 'stocks.png', 'INCOME'),
('Rent', 4, 'Rent received', 'rent.png', 'INCOME'),

-- Kavda (user_id = 5)
('Food', 5, 'Food expenses', 'food.png', 'EXPENSE'),
('Travel', 5, 'Travel charges', 'travel.png', 'EXPENSE'),
('Electronics', 5, 'Gadgets', 'electronics.png', 'EXPENSE'),
('Stocks', 5, 'Share market income', 'stocks.png', 'INCOME'),
('Rent', 5, 'Rental earnings', 'rent.png', 'INCOME');

INSERT INTO expenses (user_id, category_id, description, notes, amount, date_of_transaction)
VALUES
(1, 1, 'Lunch', 'Lunch at hotel', 450.00, '2025-01-05'),
(1, 2, 'Cab travel', 'Office commute', 1200.00, '2025-01-06'),
(1, 4, 'Stock profit', 'Stock market gains', 5000.00, '2025-01-07'),

(2, 6, 'Breakfast', 'Morning meal', 300.00, '2025-01-05'),
(2, 8, 'Headphones', 'Electronics purchase', 2500.00, '2025-01-06'),
(2, 10, 'House rent', 'Monthly rent', 8000.00, '2025-01-07'),

(3, 12, 'Bus travel', 'Daily commute', 1500.00, '2025-01-05'),
(3, 13, 'Mobile phone', 'New phone purchase', 12000.00, '2025-01-06'),
(3, 14, 'Dividend', 'Stocks dividend', 7000.00, '2025-01-07'),

(4, 16, 'Dinner', 'Restaurant dinner', 600.00, '2025-01-05'),
(4, 17, 'Trip expense', 'Travel outing', 2000.00, '2025-01-06'),
(4, 20, 'Rent received', 'Rental income', 10000.00, '2025-01-07'),

(5, 21, 'Snacks', 'Evening snacks', 350.00, '2025-01-05'),
(5, 23, 'Tablet', 'Tablet purchase', 8000.00, '2025-01-06'),
(5, 24, 'Stock gains', 'Equity profits', 6500.00, '2025-01-07');






