-- ============================================================
-- Course      : C11665 - DPR400210 Database Programming
-- Project     : Hospital Management System
-- Assignment  : Group Assignment I
-- Database    : PostgreSQL
-- ============================================================

-- ============================================================
-- INSERT PATIENTS
-- ============================================================

INSERT INTO Patients
(first_name, last_name, gender, date_of_birth, phone, email, address)

VALUES
('John','Doe','Male','1990-04-12','0788000001','john@example.com','Kigali'),

('Alice','Smith','Female','1995-06-18','0788000002','alice@example.com','Musanze'),

('Michael','Brown','Male','1988-11-09','0788000003','michael@example.com','Huye'),

('Grace','Johnson','Female','1997-02-22','0788000004','grace@example.com','Rubavu'),

('David','Wilson','Male','1986-07-15','0788000005','david@example.com','Kigali'),

('Sarah','Taylor','Female','1993-10-01','0788000006','sarah@example.com','Muhanga'),

('Daniel','Anderson','Male','1992-12-20','0788000007','daniel@example.com','Rusizi'),

('Emily','Thomas','Female','1998-03-30','0788000008','emily@example.com','Nyagatare'),

('James','Martin','Male','1989-08-14','0788000009','james@example.com','Rwamagana'),

('Olivia','Moore','Female','1996-09-05','0788000010','olivia@example.com','Kigali');

-- ============================================================
-- INSERT DOCTORS
-- ============================================================

INSERT INTO Doctors
(first_name,last_name,specialization,consultation_fee,phone,email,supervisor_id)

VALUES

('Robert','Mugisha','Cardiology',120.00,'0789000001','robert@hospital.com',NULL),

('Christine','Uwase','Neurology',150.00,'0789000002','christine@hospital.com',1),

('Patrick','Ndayisaba','Orthopedics',110.00,'0789000003','patrick@hospital.com',1),

('Linda','Mukamana','Pediatrics',90.00,'0789000004','linda@hospital.com',2),

('Joseph','Habimana','Dermatology',80.00,'0789000005','joseph@hospital.com',2),

('Diane','Mukeshimana','General Medicine',70.00,'0789000006','diane@hospital.com',3);

-- ============================================================
-- INSERT APPOINTMENTS
-- ============================================================

INSERT INTO Appointments

(patient_id,doctor_id,appointment_date,appointment_time,status,diagnosis,bill_amount)

VALUES

(1,1,'2026-01-10','09:00','Completed','Heart Checkup',350),

(2,2,'2026-01-11','10:00','Completed','Migraine',420),

(3,3,'2026-01-12','11:00','Completed','Bone Fracture',510),

(4,4,'2026-01-13','09:30','Completed','Child Fever',150),

(5,5,'2026-01-14','14:00','Completed','Skin Allergy',180),

(6,6,'2026-01-15','15:00','Completed','General Consultation',100),

(7,2,'2026-01-16','13:00','Completed','Neurological Review',480),

(8,3,'2026-01-17','08:30','Completed','Back Pain',250),

(9,4,'2026-01-18','12:00','Completed','Routine Check',120),

(10,1,'2026-01-19','10:15','Completed','Heart Monitoring',600),

(1,2,'2026-01-20','09:45','Completed','Brain Scan',550),

(2,3,'2026-01-21','10:30','Completed','Joint Pain',300),

(3,5,'2026-01-22','11:15','Completed','Skin Infection',220),

(4,6,'2026-01-23','14:45','Completed','Medical Review',110),

(5,1,'2026-01-24','08:15','Completed','Cardiac Follow-up',650),

(6,4,'2026-01-25','13:20','Completed','Pediatric Consultation',170),

(7,5,'2026-01-26','15:10','Completed','Dermatitis',260),

(8,6,'2026-01-27','09:10','Completed','General Checkup',130),

(9,2,'2026-01-28','10:40','Completed','Neurological Assessment',470),

(10,3,'2026-01-29','11:50','Completed','Orthopedic Surgery Review',720);

-- ============================================================
-- VERIFY DATA
-- ============================================================

SELECT * FROM Patients;

SELECT * FROM Doctors;

SELECT * FROM Appointments;
