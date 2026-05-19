CREATE DATABASE gym_management;
USE gym_management;
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    join_date DATE
);
SHOW TABLES;
DESCRIBE members;
INSERT INTO members
(member_id, name, age, gender, phone, join_date)
VALUES
INSERT INTO members
(member_id, name, age, gender, phone, join_date)
VALUES
(1, 'Amit Sharma', 20, 'Male', '8889078171', '2026-05-02'),
(2, 'Gaurav Pandey', 22, 'Male', '8305318769', '2026-05-03'),
(3, 'Krishna Sharma', 21, 'Male', '9993399327', '2026-05-04');

SELECT * FROM members ;

INSERT INTO members
VALUES
(4, 'Avani kaale', 19, 'Female', '5487956214', '2026-05-19');



SELECT name FROM members;

SELECT * FROM members
WHERE age > 20;

SELECT * FROM members
WHERE gender= 'male' ;


SELECT * FROM members
ORDER BY age ASC;

SELECT COUNT(*) AS total_members
FROM members;

CREATE TABLE trainers (
    trainer_id INT PRIMARY KEY,
    trainer_name VARCHAR(50),
    specialization VARCHAR(50),
    experience INT
);


INSERT INTO trainers
VALUES
(101, 'Rohit Singh', 'Weight Training', 5),
(102, 'Ankit Verma', 'Cardio', 3),
(103, 'Sahil Khan', 'Calisthenics', 4);

SELECT * FROM trainers;

INSERT INTO trainers 
VALUES
('104', 'Pankaj singh', 'Weight Training', '3');

CREATE TABLE workouts (
    workout_id INT PRIMARY KEY,
    member_id INT,
    trainer_id INT,
    workout_plan VARCHAR(100),

    FOREIGN KEY (member_id)
    REFERENCES members(member_id),

    FOREIGN KEY (trainer_id)
    REFERENCES trainers(trainer_id)
);

SELECT * FROM workouts;

INSERT INTO workouts
VALUES
(1, 1, 101, 'Chest and Triceps'),
(2, 2, 102, 'Fat Loss Cardio'),
(3, 3, 103, 'Calisthenics Beginner')

SELECT * FROM workouts;


SELECT members.name,
trainers.trainer_name,
workouts.workout_plan

FROM workouts
  
JOIN members
ON workouts.member_id = members.member_id

JOIN trainers
ON workouts.trainer_id = trainers.trainer_id;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    member_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,

    FOREIGN KEY (member_id)
    REFERENCES members(member_id)
);

INSERT INTO payments
VALUES
(1, 1, 2500.00, '2026-05-10'),
(2, 2, 2200.00, '2026-05-11'),
(3, 3, 2700.00, '2026-05-12'),
(4, 4, 2500.00, '2026-05-13');

SELECT * FROM payments;

SELECT members.name,
payments.amount,
payments.payment_date

FROM payments

JOIN members
ON payments.member_id = members.member_id;

SELECT SUM(amount) AS total_revenue
FROM payments;

SELECT AVG(amount) AS avg_revenue
FROM payments;

SELECT MAX(amount) AS maximun_revenue
FROM payments;

SELECT MIN(amount) AS minimum_revenue
FROM payments;

SELECT COUNT(*) AS total_trainers
FROM trainers;

SELECT members.name,
trainers.trainer_name

FROM workouts

JOIN members
ON workouts.member_id = members.member_id

JOIN trainers
ON workouts.trainer_id = trainers.trainer_id;

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    member_id INT,
    attendance_date DATE,
    status VARCHAR(10),

    FOREIGN KEY (member_id)
    REFERENCES members(member_id)
);

INSERT INTO attendance
VALUES
(1, 1, '2026-05-15', 'Present'),
(2, 2, '2026-05-15', 'Absent'),
(3, 3, '2026-05-15', 'Present'),
(4, 4, '2026-05-15', 'Present');

SELECT * FROM attendance;

SELECT members.name,
attendance.attendance_date,
attendance.status

FROM attendance

JOIN members
ON attendance.member_id = members.member_id;

SELECT status,
COUNT(*) AS total_members

FROM attendance

GROUP BY status;


INSERT INTO members
VALUES
(5, 'Riya Kaurav', 23, 'Female', '9876543201', '2026-05-05'),
(6, 'Aditya Rajput', 24, 'Male', '9876543202', '2026-05-06'),
(7, 'Mishthi dixit', 20, 'Female', '9876543203', '2026-05-07'),
(8, 'Karan Soni', 23, 'Male', '9876543204', '2026-05-08'),
(9, 'Anushka Malviya', 21, 'Female', '9876543205', '2026-05-09'),
(10, 'Himanshu Sahu', 26, 'Male', '9876543206', '2026-05-10'),
(11, 'Anshika Rajput', 20, 'Female', '9876543207', '2026-05-11'),
(12, 'Mohit Patel', 27, 'Male', '9876543208', '2026-05-12'),
(13, 'kamna Singh', 20, 'Female', '9876543209', '2026-05-13'),
(14, 'Arjun Mishra', 24, 'Male', '9876543211', '2026-05-14'),
(15, 'Bhavini Dubey', 22, 'Female', '9876543212', '2026-05-15'),
(16, 'Raj Malhotra', 28, 'Male', '9876543213', '2026-05-16'),
(17, 'Kavya Nair', 21, 'Female', '9876543214', '2026-05-17'),
(18, 'Aman Tiwari', 25, 'Male', '9876543215', '2026-05-18'),
(19, 'Isha Saxena', 23, 'Female', '9876543216', '2026-05-19'),
(20, 'Dev Chauhan', 26, 'Male', '9876543217', '2026-05-20');

INSERT INTO workouts
VALUES
(5, 5, 101, 'Leg Workout'),
(6, 6, 102, 'HIIT Cardio'),
(7, 7, 103, 'Beginner Calisthenics'),
(8, 8, 101, 'Chest Workout'),
(9, 9, 102, 'Fat Loss Training'),
(10, 10, 103, 'Pull Strength'),
(11, 11, 101, 'Upper Body Workout'),
(12, 12, 102, 'Core Workout'),
(13, 13, 103, 'Mobility Training'),
(14, 14, 101, 'Strength Training'),
(15, 15, 102, 'Endurance Cardio'),
(16, 16, 103, 'Advanced Calisthenics'),
(17, 17, 101, 'Leg Strength'),
(18, 18, 102, 'Weight Loss Program'),
(19, 19, 103, 'Push Pull Routine'),
(20, 20, 101, 'Full Body Workout');


INSERT INTO payments
VALUES
(5, 5, 2400.00, '2026-05-15'),
(6, 6, 2600.00, '2026-05-16'),
(7, 7, 2500.00, '2026-05-17'),
(8, 8, 3000.00, '2026-05-18'),
(9, 9, 2200.00, '2026-05-19'),
(10, 10, 2800.00, '2026-05-20'),
(11, 11, 2600.00, '2026-05-21'),
(12, 12, 2400.00, '2026-05-22'),
(13, 13, 2700.00, '2026-05-23'),
(14, 14, 2900.00, '2026-05-24'),
(15, 15, 2300.00, '2026-05-25'),
(16, 16, 3100.00, '2026-05-26'),
(17, 17, 2500.00, '2026-05-27'),
(18, 18, 2800.00, '2026-05-28'),
(19, 19, 2600.00, '2026-05-29'),
(20, 20, 3000.00, '2026-05-30');


INSERT INTO attendance
VALUES
(5, 5, '2026-05-15', 'Present'),
(6, 6, '2026-05-15', 'Absent'),
(7, 7, '2026-05-15', 'Present'),
(8, 8, '2026-05-15', 'Present'),
(9, 9, '2026-05-15', 'Absent'),
(10, 10, '2026-05-15', 'Present'),
(11, 11, '2026-05-15', 'Present'),
(12, 12, '2026-05-15', 'Absent'),
(13, 13, '2026-05-15', 'Present'),
(14, 14, '2026-05-15', 'Present'),
(15, 15, '2026-05-15', 'Absent'),
(16, 16, '2026-05-15', 'Present'),
(17, 17, '2026-05-15', 'Present'),
(18, 18, '2026-05-15', 'Absent'),
(19, 19, '2026-05-15', 'Present'),
(20, 20, '2026-05-15', 'Present');



SELECT * FROM members;
SELECT * FROM workouts;
SELECT * FROM payments;
SELECT * FROM attendance;

SELECT status,
COUNT(*) AS total

FROM attendance

GROUP BY status;


