-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the alx_book_store database
USE alx_book_store;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key for each author
    author_name VARCHAR(215) NOT NULL          -- Name of the author
);

-- Create Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,    -- Primary key for each book
    title VARCHAR(130) NOT NULL,               -- Title of the book
    author_id INT,                             -- Foreign key referencing Authors
    price DOUBLE,                              -- Price of the book
    publication_date DATE,                     -- Publication date of the book
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) -- Link to Authors table
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT, -- Primary key for each customer
    customer_name VARCHAR(215) NOT NULL,        -- Customer's name
    email VARCHAR(215) NOT NULL,                -- Customer's email
    address TEXT                                -- Customer's address
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,    -- Primary key for each order
    customer_id INT,                            -- Foreign key referencing Customers
    order_date DATE,                            -- Order date
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- Link to Customers table
);

-- Create Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key for each order detail
    order_id INT,                                 -- Foreign key referencing Orders
    book_id INT,                                  -- Foreign key referencing Books
    quantity DOUBLE,                              -- Quantity of the book in the order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), -- Link to Orders table
    FOREIGN KEY (book_id) REFERENCES Books(book_id)    -- Link to Books table
);
