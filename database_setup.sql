-- Travel Sri Lanka Blog - Database Setup Script
-- MySQL Database Creation and Table Structure

-- Create Database
CREATE DATABASE IF NOT EXISTS travel_blog CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use Database
USE travel_blog;

-- Create Blogs Table
CREATE TABLE IF NOT EXISTS blogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    excerpt TEXT,
    content LONGTEXT NOT NULL,
    image VARCHAR(255),
    author VARCHAR(100),
    category VARCHAR(50),
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    tags VARCHAR(255),
    status VARCHAR(20) DEFAULT 'published',
    INDEX idx_category (category),
    INDEX idx_created_date (created_date),
    FULLTEXT INDEX ft_search (title, excerpt, content)
) ENGINE=InnoDB;

-- Create Destinations Table
CREATE TABLE IF NOT EXISTS destinations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    image VARCHAR(255),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_name (name),
    INDEX idx_location (location)
) ENGINE=InnoDB;

-- Create Comments Table
CREATE TABLE IF NOT EXISTS comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    blog_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    comment TEXT NOT NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (blog_id) REFERENCES blogs(id) ON DELETE CASCADE,
    INDEX idx_blog_id (blog_id),
    INDEX idx_status (status),
    INDEX idx_created_date (created_date)
) ENGINE=InnoDB;

-- Create Subscribers Table
CREATE TABLE IF NOT EXISTS subscribers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    subscribed_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'active',
    INDEX idx_email (email),
    INDEX idx_status (status)
) ENGINE=InnoDB;

-- Create Contacts Table
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(255),
    message TEXT NOT NULL,
    submitted_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'unread',
    INDEX idx_email (email),
    INDEX idx_status (status),
    INDEX idx_submitted_date (submitted_date)
) ENGINE=InnoDB;

-- Create Users Table (for future admin functionality)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    role VARCHAR(50) DEFAULT 'subscriber',
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME,
    status VARCHAR(20) DEFAULT 'active',
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_role (role)
) ENGINE=InnoDB;

-- Create Categories Table
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    image VARCHAR(255),
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_name (name),
    INDEX idx_slug (slug)
) ENGINE=InnoDB;

-- Insert Sample Categories
INSERT INTO categories (name, slug, description, image) VALUES
('Beaches', 'beaches', 'Beautiful beaches and coastal destinations', 'images/category-beaches.jpg'),
('Adventure', 'adventure', 'Adventure activities and hiking', 'images/category-adventure.jpg'),
('Food', 'food', 'Local cuisine and food experiences', 'images/category-food.jpg'),
('Culture', 'culture', 'Cultural heritage and temples', 'images/category-culture.jpg'),
('Wildlife', 'wildlife', 'Wildlife and nature activities', 'images/category-wildlife.jpg');

-- Insert Sample Blogs
INSERT INTO blogs (title, excerpt, content, image, author, category, tags) VALUES
(
    'Top 10 Beaches in Sri Lanka You Must Visit',
    'Discover the most pristine and beautiful beaches in Sri Lanka. From golden sands to crystal clear waters, explore the best coastal destinations.',
    '<h3>Mirissa Beach</h3><p>Mirissa Beach is one of Sri Lanka''s most popular tourist destinations...</p>',
    'images/blog1.jpg',
    'Sarah Johnson',
    'Beaches',
    'beach,travel,sri-lanka,vacation'
),
(
    'Adventure Hiking in the Central Highlands',
    'Experience the stunning mountain landscapes of Sri Lanka''s central highlands. Perfect for adventure seekers and nature lovers.',
    '<h3>Ella Rock Trek</h3><p>The Ella Rock trek is one of the most popular hikes in Sri Lanka...</p>',
    'images/blog2.jpg',
    'Michael Chen',
    'Adventure',
    'hiking,mountains,adventure,nature'
),
(
    'Sri Lankan Cuisine: A Culinary Journey',
    'Explore the rich and diverse flavors of Sri Lankan cuisine. From curries to seafood, discover must-try dishes.',
    '<h3>Kottu Roti</h3><p>Kottu Roti is a popular street food consisting of chopped roti bread...</p>',
    'images/blog3.jpg',
    'Emma Wilson',
    'Food',
    'food,cuisine,travel,culture'
);

-- Insert Sample Destinations
INSERT INTO destinations (name, location, description, image) VALUES
('Kandy', 'Central Province', 'Home to the sacred Temple of the Tooth Relic and surrounded by misty hills covered in tea plantations.', 'images/destination1.jpg'),
('Galle', 'Southern Province', 'A historic port city featuring a stunning 16th-century fort with beautiful beaches.', 'images/destination2.jpg'),
('Ella', 'Central Highlands', 'A scenic mountain town surrounded by lush green valleys and tea plantations. Perfect for hiking.', 'images/destination3.jpg'),
('Colombo', 'Western Province', 'The capital and largest city of Sri Lanka with colonial heritage buildings.', 'images/destination4.jpg'),
('Sigiriya', 'Central Province', 'Home to an ancient rock fortress. A UNESCO World Heritage Site with stunning views.', 'images/destination5.jpg'),
('Mirissa', 'Southern Coast', 'A beautiful beach town famous for whale watching and golden beaches.', 'images/destination6.jpg');

-- Create Views for Common Queries
CREATE OR REPLACE VIEW recent_blogs AS
SELECT * FROM blogs 
WHERE status = 'published' 
ORDER BY created_date DESC 
LIMIT 10;

CREATE OR REPLACE VIEW blog_stats AS
SELECT 
    b.id,
    b.title,
    b.category,
    COUNT(c.id) as comment_count,
    b.created_date
FROM blogs b
LEFT JOIN comments c ON b.id = c.blog_id
GROUP BY b.id, b.title, b.category, b.created_date;

-- Create Stored Procedures for Common Operations
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS get_blogs_by_category(IN cat VARCHAR(50))
BEGIN
    SELECT * FROM blogs 
    WHERE category = cat AND status = 'published'
    ORDER BY created_date DESC;
END //

CREATE PROCEDURE IF NOT EXISTS get_blog_comments(IN blog_id INT)
BEGIN
    SELECT * FROM comments 
    WHERE blog_id = blog_id AND status = 'approved'
    ORDER BY created_date DESC;
END //

CREATE PROCEDURE IF NOT EXISTS get_blog_count()
BEGIN
    SELECT COUNT(*) as total_blogs FROM blogs WHERE status = 'published';
END //

DELIMITER ;

-- Display confirmation
SELECT '✅ Database setup completed successfully!' AS status;
SELECT 'Tables created:' AS info;
SHOW TABLES;
