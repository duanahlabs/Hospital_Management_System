
-- ============================================================
-- Course      : C11665 - DPR400210 Database Programming
-- Project     : Hospital Management System
-- Assignment  : Group Assignment I
-- File        : part_b_window_functions.sql
-- Database    : PostgreSQL
-- ============================================================

/*
==============================================================
PART B: SQL WINDOW FUNCTIONS
==============================================================

This file demonstrates the following Window Functions:

1. ROW_NUMBER()
2. RANK()
3. DENSE_RANK()
4. PERCENT_RANK()
5. SUM() OVER()
6. AVG() OVER()
7. MIN() OVER()
8. MAX() OVER()
9. LAG()
10. LEAD()
11. NTILE()
12. CUME_DIST()

==============================================================
*/


-- ============================================================
-- 1. ROW_NUMBER()
-- ============================================================
-- Assign a unique row number based on appointment bill amount.

SELECT
    appointment_id,
    bill_amount,
    ROW_NUMBER() OVER(ORDER BY bill_amount DESC) AS row_number
FROM Appointments;


-- ============================================================
-- 2. RANK()
-- ============================================================
-- Rank appointments by bill amount.

SELECT
    appointment_id,
    bill_amount,
    RANK() OVER(ORDER BY bill_amount DESC) AS ranking
FROM Appointments;


-- ============================================================
-- 3. DENSE_RANK()
-- ============================================================
-- Rank appointments without skipping rank numbers.

SELECT
    appointment_id,
    bill_amount,
    DENSE_RANK() OVER(ORDER BY bill_amount DESC) AS dense_rank
FROM Appointments;


-- ============================================================
-- 4. PERCENT_RANK()
-- ============================================================
-- Calculate the relative ranking of each appointment.

SELECT
    appointment_id,
    bill_amount,
    ROUND(PERCENT_RANK() OVER(ORDER BY bill_amount),2)
        AS percent_rank
FROM Appointments;


-- ============================================================
-- 5. SUM() OVER()
-- ============================================================
-- Calculate a running total of hospital revenue.

SELECT
    appointment_id,
    appointment_date,
    bill_amount,

    SUM(bill_amount)
    OVER(ORDER BY appointment_date)
    AS running_total

FROM Appointments;


-- ============================================================
-- 6. AVG() OVER()
-- ============================================================
-- Display each appointment together with the overall average bill.

SELECT
    appointment_id,
    bill_amount,

    ROUND(
        AVG(bill_amount)
        OVER(),
        2
    ) AS average_bill

FROM Appointments;


-- ============================================================
-- 7. MIN() OVER()
-- ============================================================
-- Display the minimum bill alongside every appointment.

SELECT

    appointment_id,

    bill_amount,

    MIN(bill_amount)
    OVER()
    AS minimum_bill

FROM Appointments;


-- ============================================================
-- 8. MAX() OVER()
-- ============================================================
-- Display the maximum bill alongside every appointment.

SELECT

    appointment_id,

    bill_amount,

    MAX(bill_amount)
    OVER()
    AS maximum_bill

FROM Appointments;


-- ============================================================
-- 9. LAG()
-- ============================================================
-- Compare each patient's current bill with the previous visit.

SELECT

    patient_id,

    appointment_date,

    bill_amount,

    LAG(bill_amount)
    OVER(
        PARTITION BY patient_id
        ORDER BY appointment_date
    ) AS previous_bill

FROM Appointments

ORDER BY patient_id, appointment_date;


-- ============================================================
-- 10. LEAD()
-- ============================================================
-- Display the next appointment bill for each patient.

SELECT

    patient_id,

    appointment_date,

    bill_amount,

    LEAD(bill_amount)
    OVER(
        PARTITION BY patient_id
        ORDER BY appointment_date
    ) AS next_bill

FROM Appointments

ORDER BY patient_id, appointment_date;


-- ============================================================
-- 11. NTILE()
-- ============================================================
-- Divide appointments into four billing groups.

SELECT

    appointment_id,

    bill_amount,

    NTILE(4)
    OVER(
        ORDER BY bill_amount DESC
    ) AS billing_quartile

FROM Appointments;


-- ============================================================
-- 12. CUME_DIST()
-- ============================================================
-- Display the cumulative distribution of appointment bills.

SELECT

    appointment_id,

    bill_amount,

    ROUND(
        CUME_DIST()
        OVER(
            ORDER BY bill_amount
        ),
        2
    ) AS cumulative_distribution

FROM Appointments;


-- ============================================================
-- END OF PART B
-- ============================================================
