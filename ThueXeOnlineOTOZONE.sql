create database ThueXeOnlineOTOZONE;

use ThueXeOnlineOTOZONE;

create table permission (
	permissionid int primary key,
	permissionname varchar(50),
	
);
CREATE TABLE users (
  userid INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  pssword VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  permissionid int NOT NULL,
  FOREIGN KEY (permissionid) REFERENCES permission(permissionid)
);





CREATE TABLE car_brands (
  car_brand_id INT PRIMARY KEY,
  brand_name VARCHAR(50) NOT NULL
);

CREATE TABLE car_rental_requests (
  request_id INT PRIMARY KEY,
  userid INT,
  car_brand_id INT,
  car_type VARCHAR(50) NOT NULL,
  pickup_date DATE NOT NULL,
  return_date DATE NOT NULL,
  FOREIGN KEY (userid) REFERENCES users(userid),
  FOREIGN KEY (car_brand_id) REFERENCES car_brands(car_brand_id)
);

CREATE TABLE feedbacks (
  feedback_id INT PRIMARY KEY,
  userid INT,
  feedback_text TEXT NOT NULL,
  FOREIGN KEY (userid) REFERENCES users(userid)
);


CREATE TABLE car_reviews (
  review_id INT PRIMARY KEY,
  userid INT,
  car_brand_id INT,
  review_text TEXT NOT NULL,
  rating INT NOT NULL,
  FOREIGN KEY (userid) REFERENCES users(userid),
  FOREIGN KEY (car_brand_id) REFERENCES car_brands(car_brand_id)
);

CREATE TABLE car_types (
  car_type_id INT PRIMARY KEY,
  car_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE cars (
  car_id INT PRIMARY KEY,
  car_brand_id INT,
  car_type_id INT,
  car_model VARCHAR(50) NOT NULL,
  car_description TEXT NOT NULL,
  car_image VARCHAR(50) NOT NULL,
  car_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (car_brand_id) REFERENCES car_brands(car_brand_id),
  FOREIGN KEY (car_type_id) REFERENCES car_types(car_type_id)
);

INSERT INTO permission (permissionid, permissionname) VALUES
(1, 'user'),
(2, 'admin');

INSERT INTO users (userid, username, pssword, email, phone_number, permissionid) VALUES
(1, 'johndoe', 'password', 'johndoe@example.com', '1234567890', 1),
(2, 'janedoe', 'password', 'janedoe@example.com', '0987654321', 2);

INSERT INTO car_brands (car_brand_id, brand_name) VALUES
(1, 'Toyota'),
(2, 'Honda');

INSERT INTO car_types (car_type_id, car_type_name) VALUES
(1, 'Sedan'),
(2, 'SUV');

INSERT INTO cars (car_id, car_brand_id, car_type_id, car_model, car_description, car_image, car_price) VALUES
(1, 1, 1, 'Camry', 'A mid-size car produced by Toyota', 'toyota_camry.jpg', 25000),
(2, 2, 2, 'CR-V', 'A compact SUV produced by Honda', 'honda_cr-v.jpg', 30000);

INSERT INTO car_rental_requests (request_id, userid, car_brand_id, car_type, pickup_date, return_date) VALUES
(1, 1, 1, 1, '2023-04-01', '2023-04-03'),
(2, 2, 2, 2, '2023-04-05', '2023-04-10');

INSERT INTO feedbacks (feedback_id, userid, feedback_text) VALUES
(1, 1, 'Great service!'),
(2, 2, 'Could be better.');

INSERT INTO car_reviews (review_id, userid, car_brand_id, review_text, rating) VALUES
(1, 1, 1, 'The Camry is a great car!', 4),
(2, 2, 2, 'The CR-V is a bit underwhelming.', 3);