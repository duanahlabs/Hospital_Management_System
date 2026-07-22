-- ============================================================
-- Course      : C11665 - DPR400210 Database Programming
-- Project     : Hospital Management System
-- File        : schema.sql
-- Database    : PostgreSQL
-- ============================================================

-- ============================================================
-- DROP TABLES (for easy re-execution)
-- ============================================================

DROP TABLE IF EXISTS Appointments CASCADE;
DROP TABLE IF EXISTS Doctors CASCADE;
DROP TABLE IF EXISTS Patients CASCADE;

-- ============================================================
-- TABLE 1: PATIENTS
-- ============================================================

CREATE TABLE Patients
(
    patient_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    gender VARCHAR(10)
        CHECK (gender IN ('Male','Female','Other')),

    date_of_birth DATE NOT NULL,

    phone VARCHAR(20),

    email VARCHAR(100),

    address TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE Patients IS
'Stores information about patients.';

-- ============================================================
-- TABLE 2: DOCTORS
-- ============================================================

CREATE TABLE Doctors
(
    doctor_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    specialization VARCHAR(100) NOT NULL,

    consultation_fee DECIMAL(10,2)
        CHECK (consultation_fee >= 0),

    phone VARCHAR(20),

    email VARCHAR(100),

    supervisor_id INTEGER,

    CONSTRAINT fk_supervisor
        FOREIGN KEY(supervisor_id)
        REFERENCES Doctors(doctor_id)
        ON DELETE SET NULL
);

COMMENT ON TABLE Doctors IS
'Stores doctor records and reporting hierarchy.';

-- ============================================================
-- TABLE 3: APPOINTMENTS
-- ============================================================

CREATE TABLE Appointments
(
    appointment_id SERIAL PRIMARY KEY,

    patient_id INTEGER NOT NULL,

    doctor_id INTEGER NOT NULL,

    appointment_date DATE NOT NULL,

    appointment_time TIME,

    status VARCHAR(20)
        CHECK (status IN ('Scheduled','Completed','Cancelled')),

    diagnosis TEXT,

    bill_amount DECIMAL(10,2)
        CHECK (bill_amount >= 0),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_patient
        FOREIGN KEY(patient_id)
        REFERENCES Patients(patient_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_doctor
        FOREIGN KEY(doctor_id)
        REFERENCES Doctors(doctor_id)
        ON DELETE CASCADE
);

COMMENT ON TABLE Appointments IS
'Stores all hospital appointments between patients and doctors.';

-- ============================================================
-- VERIFY TABLES
-- ============================================================

SELECT table_name
FROM information_schema.tables
WHERE table_schema='public'
ORDER BY table_name;
