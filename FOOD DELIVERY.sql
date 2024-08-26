CREATE DATABASE FOOD_DELIVERY

USE  FOOD_DELIVERY

-- Table for Customers
CREATE TABLE FOOD_DELIVERY.Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Restaurants
CREATE TABLE FOOD_DELIVERY.Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(255) NOT NULL,
    location TEXT,
    contact_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Delivery Partners
CREATE TABLE FOOD_DELIVERY.Delivery_Partners (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,
    partner_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    vehicle_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Orders
CREATE TABLE FOOD_DELIVERY.Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50), -- e.g., 'Pending', 'Accepted', 'Rejected', 'Canceled', 'Delivered'
    estimated_delivery_time TIMESTAMP, -- ETA
    actual_delivery_time TIMESTAMP
);

-- Table for Order Items
DROP TABLE FOOD_DELIVERY.Order_Items

CREATE TABLE FOOD_DELIVERY.Order_Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_name VARCHAR(255),
    quantity INT,
    price DECIMAL(10, 2)
);

-- Table for Deliveries

CREATE TABLE FOOD_DELIVERY.Deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    partner_id INT,
    status VARCHAR(50), -- e.g., 'In Transit', 'Delivered', 'Canceled', 'Customer Not Available'
    pickup_time TIMESTAMP,
    dropoff_time TIMESTAMP
);

--Seed Data 

INSERT INTO FOOD_DELIVERY.Customers (customer_name, email, phone_number, address) VALUES
('Aarav Sharma', 'aarav.sharma@example.com', '9876543210', '12, MG Road, Delhi'),
('Vivaan Singh', 'vivaan.singh@example.com', '9812345678', '45, Park Street, Kolkata'),
('Aditya Kumar', 'aditya.kumar@example.com', '9911223344', '78, Anna Nagar, Chennai'),
('Vihaan Mehta', 'vihaan.mehta@example.com', '9876541234', '22, Jayanagar, Bangalore'),
('Arjun Gupta', 'arjun.gupta@example.com', '9811223344', '56, Marine Drive, Mumbai'),
('Ishaan Verma', 'ishaan.verma@example.com', '9876545678', '33, Banjara Hills, Hyderabad'),
('Krishna Patel', 'krishna.patel@example.com', '9812349876', '19, S.G. Highway, Ahmedabad'),
('Laksh Sharma', 'laksh.sharma@example.com', '9812233445', '71, Koregaon Park, Pune'),
('Kabir Joshi', 'kabir.joshi@example.com', '9911887766', '88, Sector 18, Noida'),
('Aryan Chauhan', 'aryan.chauhan@example.com', '9898776655', '45, BTM Layout, Bangalore'),
('Dev Mishra', 'dev.mishra@example.com', '9845671234', '15, Nungambakkam, Chennai'),
('Kunal Yadav', 'kunal.yadav@example.com', '9876123456', '24, Vasant Kunj, Delhi'),
('Rohan Reddy', 'rohan.reddy@example.com', '9876432156', '90, Hi-Tech City, Hyderabad'),
('Nikhil Rao', 'nikhil.rao@example.com', '9823456789', '60, Powai, Mumbai'),
('Sahil Desai', 'sahil.desai@example.com', '9812345677', '12, Satellite, Ahmedabad'),
('Manan Kapoor', 'manan.kapoor@example.com', '9812778833', '74, Gachibowli, Hyderabad'),
('Rudra Singh', 'rudra.singh@example.com', '9812334455', '43, Andheri, Mumbai'),
('Yash Thakur', 'yash.thakur@example.com', '9876765454', '23, Anna Salai, Chennai'),
('Dhruv Kumar', 'dhruv.kumar@example.com', '9811223346', '14, Indiranagar, Bangalore'),
('Arnav Mehta', 'arnav.mehta@example.com', '9876544567', '32, Nehru Place, Delhi'),
('Jay Shah', 'jay.shah@example.com', '9811234598', '67, Maninagar, Ahmedabad'),
('Samarth Bajaj', 'samarth.bajaj@example.com', '9911223347', '55, Viman Nagar, Pune'),
('Ishaan Jain', 'ishaan.jain@example.com', '9811234511', '77, Malad, Mumbai'),
('Ayaan Agarwal', 'ayaan.agarwal@example.com', '9898776444', '28, Ballygunge, Kolkata'),
('Aman Roy', 'aman.roy@example.com', '9811223377', '19, Kormangala, Bangalore'),
('Neil Rana', 'neil.rana@example.com', '9876123434', '54, Khar, Mumbai'),
('Tanish Sharma', 'tanish.sharma@example.com', '9812788765', '39, Jubilee Hills, Hyderabad'),
('Ayush Kapoor', 'ayush.kapoor@example.com', '9876543456', '49, Cyber City, Gurgaon'),
('Parth Gupta', 'parth.gupta@example.com', '9811223322', '16, Sushant Lok, Gurgaon'),
('Aryan Sinha', 'aryan.sinha@example.com', '9876549988', '82, Whitefield, Bangalore'),
('Siddharth Reddy', 'siddharth.reddy@example.com', '9823456776', '24, Gariahat, Kolkata'),
('Harsh Sharma', 'harsh.sharma@example.com', '9812233448', '59, Alwarpet, Chennai'),
('Rudra Joshi', 'rudra.joshi@example.com', '9876545566', '93, MG Road, Delhi'),
('Advait Singh', 'advait.singh@example.com', '9811223349', '42, Madhapur, Hyderabad'),
('Ayaan Chatterjee', 'ayaan.chatterjee@example.com', '9812234456', '11, Juhu, Mumbai'),
('Ishaan Kapoor', 'ishaan.kapoor@example.com', '9911887768', '81, Whitefield, Bangalore'),
('Vivan Thakur', 'vivan.thakur@example.com', '9811223340', '26, Rajouri Garden, Delhi'),
('Aryan Sharma', 'aryan.sharma@example.com', '9876549876', '72, Kothrud, Pune'),
('Rohan Patel', 'rohan.patel@example.com', '9811234567', '31, T. Nagar, Chennai'),
('Aniket Mehta', 'aniket.mehta@example.com', '9876547654', '44, Hebbal, Bangalore'),
('Kavish Agarwal', 'kavish.agarwal@example.com', '9812233441', '61, Bandra, Mumbai'),
('Vihaan Singh', 'vihaan.singh@example.com', '9876548765', '37, Sector 62, Noida'),
('Aarav Kumar', 'aarav.kumar@example.com', '9811223343', '83, Jubilee Hills, Hyderabad'),
('Vivaan Reddy', 'vivaan.reddy@example.com', '9876545432', '27, Indiranagar, Bangalore'),
('Devansh Gupta', 'devansh.gupta@example.com', '9811223388', '41, Shalimar Bagh, Delhi'),
('Reyansh Mehta', 'reyansh.mehta@example.com', '9876543321', '65, Thane, Mumbai'),
('Arnav Jain', 'arnav.jain@example.com', '9876549870', '57, Alkapuri, Vadodara'),
('Rudra Singh', 'rura.singh@example.com', '9811223399', '76, Vasant Vihar, Delhi'),
('Shaurya Yadav', 'shaurya.yadav@example.com', '9876546789', '34, Gachibowli, Hyderabad');

INSERT INTO FOOD_DELIVERY.Restaurants (restaurant_name, location, contact_number) VALUES
('Saffron Spice', 'Connaught Place, Delhi', '9876541111'),
('Flavors of Bengal', 'Salt Lake, Kolkata', '9812342222'),
('Southern Delights', 'Adyar, Chennai', '9911223333'),
('Spice Junction', 'Jayanagar, Bangalore', '9876544444'),
('Mumbai Masala', 'Andheri, Mumbai', '9811225555'),
('The Great Indian Dhaba', 'Sector 18, Noida', '9876546666'),
('Taste of Punjab', 'Sector 62, Gurgaon', '9811237777'),
('Curry Leaves', 'Koramangala, Bangalore', '9911228888'),
('Biryani House', 'Hi-Tech City, Hyderabad', '9876549999'),
('Royal Rajwadi', 'Vastrapur, Ahmedabad', '9811221111'),
('Kerala Kitchen', 'Anna Nagar, Chennai', '9876542222'),
('The Peshawri', 'Marine Drive, Mumbai', '9811233333'),
('Nizam\'s Kebabs', 'Park Street, Kolkata', '9911224444'),
('Spicy Affair', 'Banjara Hills, Hyderabad', '9876545555'),
('Punjabi Dhaba', 'Viman Nagar, Pune', '9811226666'),
('The Coastal Curry', 'Juhu, Mumbai', '9876547777'),
('Tandoori Treats', 'T. Nagar, Chennai', '9811238888'),
('Bengali Bites', 'Salt Lake, Kolkata', '9911229999'),
('Awadhi Khana', 'Alkapuri, Vadodara', '9876540000'),
('Goa Delight', 'Sector 50, Noida', '9811231111'),
('Bombay Brasserie', 'Whitefield, Bangalore', '9876541234'),
('Lucknowi Tandoor', 'Vasant Kunj, Delhi', '9811222222'),
('Kebab Magic', 'BTM Layout, Bangalore', '9876543456'),
('Dum Pukht', 'Vasant Vihar, Delhi', '9811234567'),
('Biryani Blues', 'Indiranagar, Bangalore', '9876546789'),
('The Kathi Roll Shop', 'Gachibowli, Hyderabad', '9811223333'),
('The Tandoor', 'Andheri, Mumbai', '9876547890'),
('Urban Tadka', 'Cyber City, Gurgaon', '9811238901'),
('Bombay Biryani', 'Khar, Mumbai', '9876549012'),
('The Spice Route', 'Bandra, Mumbai', '9811221113'),
('Desi Tadka', 'Jubilee Hills, Hyderabad', '9876542345'),
('Cafe Delhi Heights', 'Nungambakkam, Chennai', '9811233456'),
('Saravana Bhavan', 'Adyar, Chennai', '9911223457'),
('Moti Mahal', 'Connaught Place, Delhi', '9876544567'),
('The Great Kebab Factory', 'Sector 15, Gurgaon', '9811235678'),
('Indigo Delicatessen', 'Powai, Mumbai', '9876545678'),
('Haldiram\'s', 'Sector 18, Noida', '9811236789'),
('Bikanervala', 'Sushant Lok, Gurgaon', '9876547891'),
('Chokhi Dhani', 'Jayanagar, Bangalore', '9811237891'),
('Barbeque Nation', 'Baner, Pune', '9876548901'),
('Mainland China', 'Thane, Mumbai', '9811238902'),
('The Chinese Village', 'Alwarpet, Chennai', '9876549013'),
('Nando\'s', 'Sector 29, Gurgaon', '9811239013'),
('Yo China', 'Rajouri Garden, Delhi', '9876540123'),
('Domino\'s Pizza', 'Indiranagar, Bangalore', '9811230123'),
('Pizza Hut', 'MG Road, Delhi', '9876541230'),
('KFC', 'Jubilee Hills, Hyderabad', '9811232345');

INSERT INTO FOOD_DELIVERY.Delivery_Partners (partner_name, phone_number, vehicle_type) VALUES
('Ravi Kumar', '9876541234', 'Bike'),
('Suresh Yadav', '9811223344', 'Scooter'),
('Ajay Mehta', '9876545678', 'Bike'),
('Vikas Sharma', '9811234567', 'Car'),
('Sunil Gupta', '9911223344', 'Scooter'),
('Rahul Singh', '9876546789', 'Bike'),
('Amit Jain', '9811223456', 'Scooter'),
('Pankaj Mishra', '9876547890', 'Bike'),
('Vishal Patel', '9811224567', 'Car'),
('Rohan Verma', '9876548901', 'Scooter'),
('Rajesh Reddy', '9811235678', 'Bike'),
('Manoj Kumar', '9876540123', 'Scooter'),
('Sanjay Singh', '9811225678', 'Bike'),
('Vikram Thakur', '9876541230', 'Car'),
('Deepak Joshi', '9811236789', 'Scooter'),
('Kiran Reddy', '9876542345', 'Bike'),
('Siddharth Rao', '9811226789', 'Car'),
('Naveen Kumar', '9876543456', 'Scooter'),
('Rakesh Gupta', '9811237890', 'Bike'),
('Arun Sharma', '9876544567', 'Scooter'),
('Harish Patel', '9811227890', 'Car'),
('Kunal Mehta', '9876545678', 'Bike'),
('Anil Yadav', '9811238901', 'Scooter'),
('Nitesh Gupta', '9876546789', 'Bike'),
('Ashok Kumar', '9811228901', 'Car'),
('Gaurav Singh', '9876547891', 'Scooter'),
('Mahesh Reddy', '9811230123', 'Bike'),
('Pawan Sharma', '9876548902', 'Car'),
('Sachin Patel', '9811231234', 'Scooter'),
('Naresh Kumar', '9876549013', 'Bike'),
('Mukesh Jain', '9811232345', 'Scooter'),
('Ankit Gupta', '9876540123', 'Car'),
('Rohit Verma', '9811233456', 'Bike'),
('Abhishek Singh', '9876541234', 'Scooter'),
('Saurabh Sharma', '9811234567', 'Bike'),
('Ajay Patel', '9876542345', 'Car'),
('Ranjit Kumar', '9811235678', 'Scooter'),
('Vikash Mehta', '9876543456', 'Bike'),
('Satish Gupta', '9811236789', 'Scooter'),
('Vinay Singh', '9876544567', 'Bike'),
('Rajesh Kumar', '9811237890', 'Car'),
('Ramesh Yadav', '9876545678', 'Scooter'),
('Ashish Sharma', '9811238901', 'Bike'),
('Sanjay Mehta', '9876546789', 'Car'),
('Prakash Patel', '9811239013', 'Scooter'),
('Umesh Gupta', '9876547891', 'Bike'),
('Akhil Kumar', '9811230123', 'Car'),
('Manish Verma', '9876548901', 'Scooter');


INSERT INTO FOOD_DELIVERY.Orders (customer_id, restaurant_id, total_amount, status, estimated_delivery_time, actual_delivery_time) VALUES
(1, 1, 350.50, 'Delivered', '2024-08-11 19:30:00', '2024-08-11 19:50:00'),
(2, 2, 450.75, 'Delivered', '2024-08-11 19:40:00', '2024-08-11 19:45:00'),
(3, 3, 550.00, 'Pending', '2024-08-11 19:50:00', NULL),
(4, 4, 600.25, 'Canceled', '2024-08-11 19:00:00', '2024-08-11 19:05:00'),
(5, 5, 250.50, 'Accepted', '2024-08-11 19:20:00', NULL),
(6, 6, 300.75, 'Delivered', '2024-08-11 19:35:00', '2024-08-11 19:55:00'),
(7, 7, 400.00, 'Pending', '2024-08-11 19:55:00', NULL),
(8, 8, 550.25, 'Delivered', '2024-08-11 19:15:00', '2024-08-11 19:35:00'),
(9, 9, 600.50, 'Accepted', '2024-08-11 19:25:00', NULL),
(10, 10, 650.75, 'Delivered', '2024-08-11 19:45:00', '2024-08-11 20:05:00'),
(11, 11, 700.00, 'Pending', '2024-08-11 20:10:00', NULL),
(12, 12, 750.25, 'Delivered', '2024-08-11 20:20:00', '2024-08-11 20:40:00'),
(13, 13, 800.50, 'Accepted', '2024-08-11 20:30:00', NULL),
(14, 14, 850.75, 'Delivered', '2024-08-11 20:40:00', '2024-08-11 21:00:00'),
(15, 15, 900.00, 'Pending', '2024-08-11 21:10:00', NULL),
(16, 16, 950.25, 'Delivered', '2024-08-11 21:20:00', '2024-08-11 21:40:00'),
(17, 17, 1000.50, 'Accepted', '2024-08-11 21:30:00', NULL),
(18, 18, 1050.75, 'Delivered', '2024-08-11 21:45:00', '2024-08-11 22:00:00'),
(19, 19, 1100.00, 'Pending', '2024-08-11 22:10:00', NULL),
(20, 20, 1150.25, 'Delivered', '2024-08-11 22:20:00', '2024-08-11 22:40:00'),
(21, 21, 1200.50, 'Accepted', '2024-08-11 22:30:00', NULL),
(22, 22, 1250.75, 'Delivered', '2024-08-11 22:45:00', '2024-08-11 23:00:00'),
(23, 23, 1300.00, 'Pending', '2024-08-11 23:10:00', NULL),
(24, 24, 1350.25, 'Delivered', '2024-08-11 23:20:00', '2024-08-11 23:40:00'),
(25, 25, 1400.50, 'Accepted', '2024-08-11 23:30:00', NULL),
(26, 26, 1450.75, 'Delivered', '2024-08-11 23:45:00', '2024-08-12 00:05:00'),
(27, 27, 1500.00, 'Pending', '2024-08-12 00:10:00', NULL),
(28, 28, 1550.25, 'Delivered', '2024-08-12 00:20:00', '2024-08-12 00:40:00'),
(29, 29, 1600.50, 'Accepted', '2024-08-12 00:30:00', NULL),
(30, 30, 1650.75, 'Delivered', '2024-08-12 00:45:00', '2024-08-12 01:05:00'),
(31, 31, 1700.00, 'Pending', '2024-08-12 01:10:00', NULL),
(32, 32, 1750.25, 'Delivered', '2024-08-12 01:20:00', '2024-08-12 01:40:00'),
(33, 33, 1800.50, 'Accepted', '2024-08-12 01:30:00', NULL),
(34, 34, 1850.75, 'Delivered', '2024-08-12 01:45:00', '2024-08-12 02:00:00'),
(35, 35, 1900.00, 'Pending', '2024-08-12 02:10:00', NULL),
(36, 36, 1950.25, 'Delivered', '2024-08-12 02:20:00', '2024-08-12 02:40:00'),
(37, 37, 2000.50, 'Accepted', '2024-08-12 02:30:00', NULL),
(38, 38, 2050.75, 'Delivered', '2024-08-12 02:45:00', '2024-08-12 03:00:00'),
(39, 39, 2100.00, 'Pending', '2024-08-12 03:10:00', NULL),
(40, 40, 2150.25, 'Delivered', '2024-08-12 03:20:00', '2024-08-12 03:40:00'),
(41, 41, 2200.50, 'Accepted', '2024-08-12 03:30:00', NULL),
(42, 42, 2250.75, 'Delivered', '2024-08-12 03:45:00', '2024-08-12 04:00:00'),
(43, 43, 2300.00, 'Pending', '2024-08-12 04:10:00', NULL),
(44, 44, 2350.25, 'Delivered', '2024-08-12 04:20:00', '2024-08-12 04:40:00'),
(45, 45, 2400.50, 'Accepted', '2024-08-12 04:30:00', NULL),
(46, 46, 2450.75, 'Delivered', '2024-08-12 04:45:00', '2024-08-12 05:00:00'),
(47, 47, 2500.00, 'Pending', '2024-08-12 05:10:00', NULL),
(48, 48, 2550.25, 'Delivered', '2024-08-12 05:20:00', '2024-08-12 05:40:00'),
(49, 49, 2600.50, 'Accepted', '2024-08-12 05:30:00', NULL),
(50, 50, 2650.75, 'Delivered', '2024-08-12 05:45:00', '2024-08-12 06:00:00');

INSERT INTO FOOD_DELIVERY.Order_Items (order_id, item_name, quantity, price) VALUES
(1, 'Paneer Butter Masala', 1, 150.50),
(1, 'Garlic Naan', 2, 100.00),
(2, 'Chicken Biryani', 1, 250.75),
(2, 'Raita', 1, 50.00),
(3, 'Veg Pulao', 1, 120.00),
(3, 'Dal Tadka', 1, 180.00),
(4, 'Butter Chicken', 1, 350.25),
(4, 'Tandoori Roti', 2, 100.00),
(5, 'Chole Bhature', 1, 150.50),
(5, 'Lassi', 1, 100.00),
(6, 'Mutton Biryani', 1, 300.75),
(6, 'Raita', 1, 50.00),
(7, 'Paneer Tikka', 1, 200.00),
(7, 'Naan', 2, 100.00),
(8, 'Kadhai Chicken', 1, 250.25),
(8, 'Tandoori Roti', 2, 100.00),
(9, 'Veg Biryani', 1, 200.50),
(9, 'Curd', 1, 50.00),
(10, 'Dal Makhani', 1, 300.75),
(10, 'Jeera Rice', 1, 100.00),
(11, 'Chicken Tikka', 1, 350.00),
(11, 'Butter Naan', 2, 100.00),
(12, 'Paneer Lababdar', 1, 400.25),
(12, 'Garlic Naan', 2, 100.00),
(13, 'Aloo Paratha', 2, 100.50),
(13, 'Curd', 1, 50.00),
(14, 'Fish Curry', 1, 450.75),
(14, 'Rice', 1, 100.00),
(15, 'Chicken Curry', 1, 500.00),
(15, 'Roti', 2, 100.00),
(16, 'Paneer Bhurji', 1, 550.25),
(16, 'Naan', 2, 100.00),
(17, 'Mutton Rogan Josh', 1, 600.50),
(17, 'Rice', 1, 100.00),
(18, 'Egg Curry', 1, 650.75),
(18, 'Roti', 2, 100.00),
(19, 'Dal Fry', 1, 700.00),
(19, 'Rice', 1, 100.00),
(20, 'Veg Kolhapuri', 1, 750.25),
(20, 'Naan', 2, 100.00),
(21, 'Palak Paneer', 1, 800.50),
(21, 'Garlic Naan', 2, 100.00),
(22, 'Paneer Pasanda', 1, 850.75),
(22, 'Butter Naan', 2, 100.00),
(23, 'Shahi Paneer', 1, 900.00),
(23, 'Roti', 2, 100.00),
(24, 'Dal Tadka', 1, 950.25),
(24, 'Jeera Rice', 1, 100.00),
(25, 'Aloo Gobi', 1, 1000.50),
(25, 'Roti', 2, 100.00),
(26, 'Chana Masala', 1, 1050.75),
(26, 'Rice', 1, 100.00),
(27, 'Matar Paneer', 1, 1100.00),
(27, 'Naan', 2, 100.00),
(28, 'Kadhi Pakora', 1, 1150.25),
(28, 'Rice', 1, 100.00),
(29, 'Paneer Do Pyaza', 1, 1200.50),
(29, 'Roti', 2, 100.00),
(30, 'Bhindi Masala', 1, 1250.75),
(30, 'Rice', 1, 100.00),
(31, 'Aloo Matar', 1, 1300.00),
(31, 'Roti', 2, 100.00),
(32, 'Methi Malai Murg', 1, 1350.25),
(32, 'Rice', 1, 100.00),
(33, 'Lamb Curry', 1, 1400.50),
(33, 'Roti', 2, 100.00),
(34, 'Egg Bhurji', 1, 1450.75),
(34, 'Rice', 1, 100.00),
(35, 'Paneer Korma', 1, 1500.00),
(35, 'Naan', 2, 100.00),
(36, 'Malai Kofta', 1, 1550.25),
(36, 'Jeera Rice', 1, 100.00),
(37, 'Chicken Masala', 1, 1600.50),
(37, 'Naan', 2, 100.00),
(38, 'Prawn Curry', 1, 1650.75),
(38, 'Rice', 1, 100.00),
(39, 'Kadhai Paneer', 1, 1700.00),
(39, 'Roti', 2, 100.00),
(40, 'Mutton Keema', 1, 1750.25),
(40, 'Rice', 1, 100.00),
(41, 'Egg Curry', 1, 1800.50),
(41, 'Roti', 2, 100.00),
(42, 'Paneer Tikka Masala', 1, 1850.75),
(42, 'Naan', 2, 100.00),
(43, 'Mutton Biryani', 1, 1900.00),
(43, 'Raita', 1, 100.00),
(44, 'Fish Fry', 1, 1950.25),
(44, 'Rice', 1, 100.00),
(45, 'Chicken Korma', 1, 2000.50),
(45, 'Roti', 2, 100.00),
(46, 'Vegetable Pulao', 1, 2050.75),
(46, 'Raita', 1, 100.00),
(47, 'Dal Makhani', 1, 2100.00),
(47, 'Rice', 1, 100.00),
(48, 'Paneer Bhurji', 1, 2150.25),
(48, 'Naan', 2, 100.00),
(49, 'Butter Chicken', 1, 2200.50),
(49, 'Garlic Naan', 2, 100.00),
(50, 'Mutton Rogan Josh', 1, 2250.75),
(50, 'Rice', 1, 100.00);


INSERT INTO FOOD_DELIVERY.Orders (customer_id, restaurant_id, total_amount, status, estimated_delivery_time, actual_delivery_time) VALUES
(1, 1, 350.50, 'Delivered', '2024-08-11 19:30:00', '2024-08-11 19:50:00'),
(2, 2, 450.75, 'Delivered', '2024-08-11 19:40:00', '2024-08-11 19:45:00'),
(3, 3, 550.00, 'Pending', '2024-08-11 19:50:00', NULL),
(4, 4, 600.25, 'Canceled', '2024-08-11 19:00:00', '2024-08-11 19:05:00'),
(5, 5, 250.50, 'Accepted', '2024-08-11 19:20:00', NULL),
(6, 6, 300.75, 'Delivered', '2024-08-11 19:35:00', '2024-08-11 19:55:00'),
(7, 7, 400.00, 'Pending', '2024-08-11 19:55:00', NULL),
(8, 8, 550.25, 'Delivered', '2024-08-11 19:15:00', '2024-08-11 19:35:00'),
(9, 9, 600.50, 'Accepted', '2024-08-11 19:25:00', NULL),
(10, 10, 650.75, 'Delivered', '2024-08-11 19:45:00', '2024-08-11 20:05:00'),
(11, 11, 700.00, 'Pending', '2024-08-11 20:10:00', NULL),
(12, 12, 750.25, 'Delivered', '2024-08-11 20:20:00', '2024-08-11 20:40:00'),
(13, 13, 800.50, 'Accepted', '2024-08-11 20:30:00', NULL),
(14, 14, 850.75, 'Delivered', '2024-08-11 20:40:00', '2024-08-11 21:00:00'),
(15, 15, 900.00, 'Pending', '2024-08-11 21:10:00', NULL),
(16, 16, 950.25, 'Delivered', '2024-08-11 21:20:00', '2024-08-11 21:40:00'),
(17, 17, 1000.50, 'Accepted', '2024-08-11 21:30:00', NULL),
(18, 18, 1050.75, 'Delivered', '2024-08-11 21:45:00', '2024-08-11 22:00:00'),
(19, 19, 1100.00, 'Pending', '2024-08-11 22:10:00', NULL),
(20, 20, 1150.25, 'Delivered', '2024-08-11 22:20:00', '2024-08-11 22:40:00'),
(21, 21, 1200.50, 'Accepted', '2024-08-11 22:30:00', NULL),
(22, 22, 1250.75, 'Delivered', '2024-08-11 22:45:00', '2024-08-11 23:00:00'),
(23, 23, 1300.00, 'Pending', '2024-08-11 23:10:00', NULL),
(24, 24, 1350.25, 'Delivered', '2024-08-11 23:20:00', '2024-08-11 23:40:00'),
(25, 25, 1400.50, 'Accepted', '2024-08-11 23:30:00', NULL),
(26, 26, 1450.75, 'Delivered', '2024-08-11 23:45:00', '2024-08-12 00:05:00'),
(27, 27, 1500.00, 'Pending', '2024-08-12 00:10:00', NULL),
(28, 28, 1550.25, 'Delivered', '2024-08-12 00:20:00', '2024-08-12 00:40:00'),
(29, 29, 1600.50, 'Accepted', '2024-08-12 00:30:00', NULL),
(30, 30, 1650.75, 'Delivered', '2024-08-12 00:45:00', '2024-08-12 01:05:00'),
(31, 31, 1700.00, 'Pending', '2024-08-12 01:10:00', NULL),
(32, 32, 1750.25, 'Delivered', '2024-08-12 01:20:00', '2024-08-12 01:40:00'),
(33, 33, 1800.50, 'Accepted', '2024-08-12 01:30:00', NULL),
(34, 34, 1850.75, 'Delivered', '2024-08-12 01:45:00', '2024-08-12 02:00:00'),
(35, 35, 1900.00, 'Pending', '2024-08-12 02:10:00', NULL),
(36, 36, 1950.25, 'Delivered', '2024-08-12 02:20:00', '2024-08-12 02:40:00'),
(37, 37, 2000.50, 'Accepted', '2024-08-12 02:30:00', NULL),
(38, 38, 2050.75, 'Delivered', '2024-08-12 02:45:00', '2024-08-12 03:00:00'),
(39, 39, 2100.00, 'Pending', '2024-08-12 03:10:00', NULL),
(40, 40, 2150.25, 'Delivered', '2024-08-12 03:20:00', '2024-08-12 03:40:00'),
(41, 41, 2200.50, 'Accepted', '2024-08-12 03:30:00', NULL),
(42, 42, 2250.75, 'Delivered', '2024-08-12 03:45:00', '2024-08-12 04:00:00'),
(43, 43, 2300.00, 'Pending', '2024-08-12 04:10:00', NULL),
(44, 44, 2350.25, 'Delivered', '2024-08-12 04:20:00', '2024-08-12 04:40:00'),
(45, 45, 2400.50, 'Accepted', '2024-08-12 04:30:00', NULL),
(46, 46, 2450.75, 'Delivered', '2024-08-12 04:45:00', '2024-08-12 05:00:00'),
(47, 47, 2500.00, 'Pending', '2024-08-12 05:10:00', NULL),
(48, 48, 2550.25, 'Delivered', '2024-08-12 05:20:00', '2024-08-12 05:40:00'),
(49, 49, 2600.50, 'Accepted', '2024-08-12 05:30:00', NULL),
(50, 50, 2650.75, 'Delivered', '2024-08-12 05:45:00', '2024-08-12 06:00:00');


INSERT INTO FOOD_DELIVERY.Deliveries (order_id, partner_id, status, pickup_time, dropoff_time) VALUES
(1, 1, 'Delivered', '2024-08-11 19:00:00', '2024-08-11 19:20:00'),
(2, 2, 'Delivered', '2024-08-11 19:10:00', '2024-08-11 19:30:00'),
(3, 3, 'In Transit', '2024-08-11 19:20:00', NULL),
(4, 4, 'Canceled', '2024-08-11 18:50:00', '2024-08-11 19:00:00'),
(5, 5, 'In Transit', '2024-08-11 19:30:00', NULL),
(6, 6, 'Delivered', '2024-08-11 19:45:00', '2024-08-11 20:05:00'),
(7, 7, 'In Transit', '2024-08-11 20:00:00', NULL),
(8, 8, 'Delivered', '2024-08-11 19:25:00', '2024-08-11 19:45:00'),
(9, 9, 'In Transit', '2024-08-11 19:35:00', NULL),
(10, 10, 'Delivered', '2024-08-11 19:55:00', '2024-08-11 20:15:00'),
(11, 11, 'In Transit', '2024-08-11 20:05:00', NULL),
(12, 12, 'Delivered', '2024-08-11 20:25:00', '2024-08-11 20:45:00'),
(13, 13, 'In Transit', '2024-08-11 20:35:00', NULL),
(14, 14, 'Delivered', '2024-08-11 20:50:00', '2024-08-11 21:10:00'),
(15, 15, 'In Transit', '2024-08-11 21:00:00', NULL),
(16, 16, 'Delivered', '2024-08-11 21:25:00', '2024-08-11 21:45:00'),
(17, 17, 'In Transit', '2024-08-11 21:35:00', NULL),
(18, 18, 'Delivered', '2024-08-11 21:50:00', '2024-08-11 22:10:00'),
(19, 19, 'In Transit', '2024-08-11 22:05:00', NULL),
(20, 20, 'Delivered', '2024-08-11 22:25:00', '2024-08-11 22:45:00'),
(21, 21, 'In Transit', '2024-08-11 22:35:00', NULL),
(22, 22, 'Delivered', '2024-08-11 22:50:00', '2024-08-11 23:10:00'),
(23, 23, 'In Transit', '2024-08-11 23:05:00', NULL),
(24, 24, 'Delivered', '2024-08-11 23:25:00', '2024-08-11 23:45:00'),
(25, 25, 'In Transit', '2024-08-11 23:35:00', NULL),
(26, 26, 'Delivered', '2024-08-11 23:50:00', '2024-08-12 00:10:00'),
(27, 27, 'In Transit', '2024-08-12 00:05:00', NULL),
(28, 28, 'Delivered', '2024-08-12 00:25:00', '2024-08-12 00:45:00'),
(29, 29, 'In Transit', '2024-08-12 00:35:00', NULL),
(30, 30, 'Delivered', '2024-08-12 00:50:00', '2024-08-12 01:10:00'),
(31, 31, 'In Transit', '2024-08-12 01:05:00', NULL),
(32, 32, 'Delivered', '2024-08-12 01:25:00', '2024-08-12 01:45:00'),
(33, 33, 'In Transit', '2024-08-12 01:35:00', NULL),
(34, 34, 'Delivered', '2024-08-12 01:50:00', '2024-08-12 02:10:00'),
(35, 35, 'In Transit', '2024-08-12 02:05:00', NULL),
(36, 36, 'Delivered', '2024-08-12 02:25:00', '2024-08-12 02:45:00'),
(37, 37, 'In Transit', '2024-08-12 02:35:00', NULL),
(38, 38, 'Delivered', '2024-08-12 02:50:00', '2024-08-12 03:10:00'),
(39, 39, 'In Transit', '2024-08-12 03:05:00', NULL),
(40, 40, 'Delivered', '2024-08-12 03:25:00', '2024-08-12 03:45:00'),
(41, 41, 'In Transit', '2024-08-12 03:35:00', NULL),
(42, 42, 'Delivered', '2024-08-12 03:50:00', '2024-08-12 04:10:00'),
(43, 43, 'In Transit', '2024-08-12 04:05:00', NULL),
(44, 44, 'Delivered', '2024-08-12 04:25:00', '2024-08-12 04:45:00'),
(45, 45, 'In Transit', '2024-08-12 04:35:00', NULL),
(46, 46, 'Delivered', '2024-08-12 04:50:00', '2024-08-12 05:10:00'),
(47, 47, 'In Transit', '2024-08-12 05:05:00', NULL),
(48, 48, 'Delivered', '2024-08-12 05:25:00', '2024-08-12 05:45:00'),
(49, 49, 'In Transit', '2024-08-12 05:35:00', NULL),
(50, 50, 'Delivered', '2024-08-12 05:50:00', '2024-08-12 06:10:00');


--1. Find the total amount spent by each customer on orders.
USE FOOD_DELIVERY

SELECT cx.customer_name,SUM(od.total_amount) as Total_Spend  FROM FOOD_DELIVERY.`Customers` cx RIGHT JOIN FOOD_DELIVERY.`Orders` od ON cx.customer_id=od.customer_id WHERE od.status='Delivered'
GROUP BY cx.customer_name;

--Retrieve the top 5 restaurants with the highest number of orders.
SELECT rs.restaurant_name, COUNT(od.order_id) as ORDER_COUNT FROM `Restaurants` rs LEFT JOIN `Orders` od ON rs.restaurant_id=od.restaurant_id
GROUP BY rs.restaurant_name
ORDER BY ORDER_COUNT DESC
LIMIT 5;

--List all orders that were delivered later than the estimated delivery time
SELECT *, TIMESTAMPDIFF(MINUTE,estimated_delivery_time,actual_delivery_time) as Total_Delay from `Orders` WHERE actual_delivery_time>estimated_delivery_time AND status='Delivered'
ORDER BY Total_Delay DESC;


--Find the average order value for each restaurant.
SELECT rs.restaurant_name,ROUND(AVG(od.total_amount),2) as AVG_AMOUNT FROM `Restaurants` rs LEFT JOIN `Orders` od ON rs.restaurant_id=od.restaurant_id
GROUP BY rs.restaurant_name
ORDER BY AVG_AMOUNT DESC;

--Identify the delivery partners who have never delivered an order.

SELECT dp.partner_name, COUNT(dl.order_id) AS CNT_OD FROM `Delivery_Partners` dp LEFT JOIN `Deliveries` dl ON dp.partner_id=dl.partner_id
GROUP BY dp.partner_name
HAVING CNT_OD=NULL

--Find the total quantity of each item sold by all restaurants combined
SELECT `OD`.item_name,SUM(`OD`.quantity) AS Total_Qty  FROM `Order_Items` OD
GROUP BY `OD`.item_name
ORDER BY Total_Qty DESC;

--List the customers who have placed more than 3 orders
SELECT cx.customer_name,COUNT(od.order_id) AS Count_Orders FROM `Customers` cx LEFT JOIN `Orders` od ON cx.customer_id=od.customer_id
GROUP BY cx.customer_name
HAVING Count_Orders>=3;

--Find the order with the highest total amount.
SELECT * from `Orders`
ORDER BY total_amount DESC
LIMIT 1;

--Retrieve the list of restaurants that have delivered food in the last 7 days
SELECT * from `Orders` WHERE actual_delivery_time > SYSDATE()- INTERVAL 7 DAY;

--Calculate the percentage of orders that were delivered on time by each delivery partner
SELECT partner_id,Total_del_partner ,Total_del,Total_del_partner/Total_del*100 AS Percentage FROM (
SELECT *, COUNT(`Deliveries`.order_id) OVER() as Total_del,COUNT(`Deliveries`.order_id) OVER(PARTITION BY partner_id) as Total_del_partner FROM `Deliveries`
) AS M


--List the names of the customers who have ordered every item available in the database.
SELECT OD.customer_id,COUNT(DISTINCT OI.item_id) AS ORDER_IT FROM `Orders` OD RIGHT JOIN `Order_Items` OI ON OD.order_id=OI.order_id
GROUP BY OD.customer_id
HAVING ORDER_IT = (SELECT COUNT(DISTINCT OL.item_name ) FROM `Order_Items` OL)

--Get the details of the order with the maximum number of items.
SELECT OD.order_id,CX.customer_name ,SUM(OI.quantity) AS Total_Qty FROM `Order_Items` OI JOIN `Orders` OD ON  OI.order_id=`OD`.order_id LEFT JOIN `Customers` CX ON OD.customer_id=CX.customer_id
GROUP BY `CX`.customer_name, OD.order_id
ORDER BY Total_Qty DESC;

--List the top 3 most frequently ordered items.

SELECT `Order_Items`.item_name, SUM(`Order_Items`.quantity) as frequency from `Order_Items`
GROUP BY item_name
ORDER BY frequency DESC
LIMIT 3;

--Find the average delivery time for each delivery partner.
SELECT DL.partner_id,DP.partner_name,ROUND(AVG(TIMESTAMPDIFF(MINUTE,DL.pickup_time,DL.dropoff_time)),2) AS AVG_DEL_TIME from `Deliveries` DL JOIN `Delivery_Partners` DP ON DL.partner_id=DP.partner_id 
GROUP BY `DL`.partner_id,DP.partner_name;

--Calculate the total revenue generated by each restaurant.
SELECT RS.restaurant_name,SUM(OD.total_amount) AS TOT_REV FROM `Orders` OD JOIN `Restaurants` RS ON OD.restaurant_id=RS.restaurant_id WHERE OD.status='Delivered'
GROUP BY RS.restaurant_name
ORDER BY TOT_REV DESC;

-- Get the names of customers who have never placed an order

SELECT CX.customer_name FROM `Customers` CX RIGHT JOIN `Orders` OD ON CX.customer_id!=OD.customer_id 

--Find the most popular item in terms of quantity ordered.
SELECT `Order_Items`.item_name,SUM(`Order_Items`.quantity) AS Amount_order FROM `Order_Items`
GROUP BY `Order_Items`.item_name
ORDER BY Amount_order DESC
LIMIT 1;

-- List all the orders along with the corresponding delivery partner's name and status.
SELECT DP.partner_name, OD.order_id, OD.status FROM `Orders` OD JOIN `Deliveries` DD ON OD.order_id=DD.order_id JOIN `Delivery_Partners` DP ON DD.partner_id=DP.partner_id

--Find all the orders where the same item was ordered more than once.
SELECT * FROM `Order_Items` WHERE `Order_Items`.quantity>1

--Calculate the total time spent by each delivery partner on deliveries
SELECT DP.partner_name, SUM(TIMESTAMPDIFF(MINUTE,DD.pickup_time,DD.dropoff_time)) AS Total_Time FROM `Deliveries` DD JOIN `Delivery_Partners` DP ON DD.partner_id=DP.partner_id
GROUP BY DP.partner_name
ORDER BY Total_Time DESC;

--List the delivery partners who have delivered to more than 10 different customers
SELECT DP.partner_name, COUNT(DISTINCT OD.customer_id) AS DIST_CX FROM `Deliveries` DL JOIN `Orders` OD ON DL.order_id=OD.order_id JOIN `Delivery_Partners` DP ON DL.partner_id=DP.partner_id
GROUP BY DP.partner_name
HAVING DIST_CX >=10;

--Get the average number of items per order for each restaurant

SELECT RS.restaurant_name, ROUND(AVG(OI.quantity),2) as AVG_QTY FROM `Order_Items` OI JOIN `Orders` OD ON OI.order_id=OD.order_id JOIN `Restaurants` RS ON OD.restaurant_id= RS.restaurant_id
GROUP BY RS.restaurant_name

-- Identify the orders that were canceled after the food was already picked up 
SELECT DL.order_id,OI.item_name,OI.quantity,OI.price FROM `Deliveries` DL JOIN `Orders` OD ON DL.order_id=OD.order_id JOIN `Order_Items` OI ON OD.order_id=OI.order_id WHERE `OD`.status='Canceled' AND DL.pickup_time IS NOT NULL


--Calculate the running total of order amounts for each customer.

SELECT OD.customer_id,CX.customer_name, SUM(OD.total_amount) OVER(PARTITION BY `OD`.customer_id) as RUNNING_TOTAL  from `Orders` OD JOIN `Customers` CX ON OD.customer_id=CX.customer_id

--Rank the restaurants based on the total revenue they generated.
SELECT OD.restaurant_id,RS.restaurant_name,RANK() OVER(ORDER BY SUM(OD.total_amount)) as REV_RANK FROM `Orders` OD JOIN `Restaurants` RS ON `OD`.restaurant_id=RS.restaurant_id
GROUP BY RS.restaurant_name,OD.restaurant_id

--Find the lead and lag in delivery times for each delivery partner
SELECT DD.partner_id,DP.partner_name,LEAD(DD.dropoff_time) OVER(PARTITION BY DP.partner_id ORDER BY DD.dropoff_time) FROM `Deliveries` DD JOIN `Delivery_Partners` DP ON DD.partner_id=DP.partner_id

--Calculate the moving average of the total amount for the last 3 orders per customer.
SELECT OD.customer_id,CX.customer_name,AVG(OD.total_amount) OVER(PARTITION BY OD.customer_id ORDER BY OD.order_time ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) FROM `Orders` OD JOIN `Customers` CX ON OD.customer_id=CX.customer_id

--Identify the most expensive order per customer using the ROW_NUMBER function
SELECT * FROM 
(
SELECT OD.customer_id,CX.customer_name,OD.total_amount, ROW_NUMBER() OVER(PARTITION BY OD.customer_id ORDER BY OD.total_amount) AS RANK_NUMBER FROM `Orders` OD RIGHT JOIN `Customers` CX ON OD.customer_id=CX.customer_id
) MAIN_TABL
WHERE RANK_NUMBER=1 AND customer_id IS NOT NULL


SHOW TABLES

DELIMITER $$
CREATE PROCEDURE show_cx(customer_id INT)
BEGIN 
DECLARE cx_id INT;
SELECT COUNT(1) INTO cx_id FROM `Customers` WHERE `Customers`.customer_id=customer_id;
IF cx_id >0 THEN SELECT * from `Customers` WHERE `Customers`.customer_id=customer_id;
    ELSE SELECT 'INVALID'
END IF;
END;
$$


