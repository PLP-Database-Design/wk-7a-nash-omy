-- answers.sql

-- Question 1: Achieving 1NF (First Normal Form)
-- Breaking down the multi-valued 'Products' column into individual rows

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Inserting individual products for each order to meet 1NF requirements
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (103, 'Emily Clark', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form)
-- Removing partial dependencies by separating customer details from order items

-- Step 1: Create a separate table for orders with customer info (no partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Populate the Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES (101, 'John Doe');
INSERT INTO Orders (OrderID, CustomerName) VALUES (102, 'Jane Smith');
INSERT INTO Orders (OrderID, CustomerName) VALUES (103, 'Emily Clark');

-- Step 3: Create a table for order items referencing orders
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Populate the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (103, 'Phone', 1);
