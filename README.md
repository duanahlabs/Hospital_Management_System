# Hospital Management System
### Advanced SQL Programming using Common Table Expressions (CTEs) & Window Functions


## Course Information

| Item | Details |
|------|---------|
| **Course** | C11665 – DPR400210: Database Programming |
| **Institution** | University of Lay Adventists of Kigali (UNILAK) |
| **Instructor** | Eric Maniraguha |
| **Project** | Group Assignment I – Common Table Expressions (CTEs) & SQL Window Functions |
| **Database** | PostgreSQL |

---

# Project Overview

Modern healthcare organizations manage thousands of patient records, doctor profiles, appointments, medical bills, and administrative activities every day. As the amount of data increases, retrieving meaningful information using ordinary SQL queries becomes increasingly difficult. Complex reports often require multiple joins, nested queries, and repetitive calculations that are difficult to read, maintain, and optimize.

Ths project demonstrates how advanced SQL techniques can simplify database analysis through the use of **Common Table Expressions (CTEs)** and **SQL Window Functions**.

A Hospital Management System was selected as the business scenario because hospitals continuously generate large volumes of transactional data that require analytical reporting. The database created in this project models real hospital operations and demonstrates how advanced SQL can be used to support management decisions.

The project was developed using PostgreSQL and satisfies all assignment requirements by implementing relational database design principles together with analytical SQL queries.

---

# Business Problem

Hospital administrators often require reports that answer questions such as:

- Which doctors generate the highest revenue?
- Which patients frequently visit the hospital?
- What is the organizational reporting structure among doctors?
- Which department performs best financially?
- How do current patient bills compare with previous visits?
- Which appointments belong to the highest billing categories?

Producing these reports using traditional SQL can become complicated because of multiple joins, nested subqueries, and repeated calculations.

This project addresses these challenges by using Common Table Expressions (CTEs) to simplify complex queries and SQL Window Functions to perform advanced analytical calculations without modifying the underlying data.

---

# Objectives

The primary objectives of this project are:

- Design a relational database consisting of three related tables.
- Implement advanced SQL queries using Common Table Expressions.
- Demonstrate SQL Window Functions for analytical reporting.
- Generate meaningful business insights from hospital data.
- Apply PostgreSQL best practices in database programming.

---

# Business Scenario

The Hospital Management System stores information about:

- Patients
- Doctors
- Medical appointments

Each appointment connects one patient with one doctor and records appointment dates, billing information, and appointment status.

The database enables hospital management to monitor operational performance, financial performance, and patient activities.

---

# Database Design

The database contains three related tables.

## 1. Patients

Stores personal information for every patient.

Main attributes include:

- Patient ID
- First Name
- Last Name
- Gender
- Date of Birth
- Phone Number

---

## 2. Doctors

Stores doctor information including medical specialization and organizational hierarchy.

Main attributes include:

- Doctor ID
- First Name
- Last Name
- Specialization
- Consultation Fee
- Supervisor ID

The **Supervisor ID** references another doctor, allowing recursive queries to analyze management hierarchies.

---

## 3. Appointments

Acts as the relationship table connecting patients and doctors.

Each appointment records:

- Appointment ID
- Patient ID
- Doctor ID
- Appointment Date
- Status
- Bill Amount

---

# Entity Relationship Diagram

```
                    +----------------------+
                    |      PATIENTS        |
                    +----------------------+
                    | PK patient_id        |
                    | first_name           |
                    | last_name            |
                    | gender               |
                    | date_of_birth        |
                    | phone                |
                    +----------+-----------+
                               |
                               |
                              (1)
                               |
                               |
                              (*)
                    +----------+-----------+
                    |    APPOINTMENTS      |
                    +----------------------+
                    | PK appointment_id    |
                    | FK patient_id        |
                    | FK doctor_id         |
                    | appointment_date     |
                    | status               |
                    | bill_amount          |
                    +----------+-----------+
                               |
                              (*)
                               |
                               |
                              (1)
                    +----------+-----------+
                    |      DOCTORS         |
                    +----------------------+
                    | PK doctor_id         |
                    | first_name           |
                    | last_name            |
                    | specialization       |
                    | consultation_fee     |
                    | FK supervisor_id     |
                    +----------------------+
```

---

# Technologies Used

- PostgreSQL
- SQL
- Git
- GitHub
- pgAdmin 4

---

# Project Structure

```
database_programming_assignment1_30866_Shedrick
│
├── README.md
├── schema.sql
├── seed.sql
├── part_a_ctes.sql
├── part_b_window_functions.sql
├── ER_Diagram.png
├── LICENSE
├── .gitignore
│
└── screenshots
```

---

# Common Table Expressions (CTEs)

Five different Common Table Expressions were implemented.

## 1. Simple CTE

Filters completed appointments with high billing values.

**Business Value**

Allows hospital management to quickly identify high-value medical services for financial reporting.

---

## 2. Multiple CTEs

Combines doctor information with revenue summaries.

**Business Value**

Produces departmental reports using readable and maintainable SQL.

---

## 3. Recursive CTE

Traverses the doctor reporting hierarchy.

**Business Value**

Automatically generates organizational structures without manual processing.

---

## 4. Aggregation CTE

Calculates:

- Total visits
- Total spending
- Average spending

for each patient.

**Business Value**

Helps identify valuable patients and analyze long-term healthcare utilization.

---

## 5. JOIN CTE

Combines patient, doctor, and appointment information into a single report.

**Business Value**

Produces comprehensive appointment reports for administrative purposes.

---

# SQL Window Functions

The project demonstrates four categories of SQL Window Functions.

---

## Ranking Functions

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PERCENT_RANK()

These functions compare appointment bills and doctor performance without collapsing the dataset.

---

## Aggregate Window Functions

- SUM() OVER()
- AVG() OVER()
- MIN() OVER()
- MAX() OVER()

These functions calculate running totals and departmental statistics while preserving individual records.

---

## Navigation Functions

- LAG()
- LEAD()

These compare current appointments with previous and future appointments.

This enables trend analysis for patient billing history.

---

## Distribution Functions

- NTILE()
- CUME_DIST()

These divide appointments into billing categories and determine cumulative distribution.

They help identify high-value and low-value appointments.

---

# Analysis and Findings

## Descriptive Analysis

The database demonstrates that:

- Cardiology generated the highest total billing revenue.
- Some patients visited multiple times.
- Several doctors supervise junior doctors.
- Appointment costs vary according to specialization.

---

## Diagnostic Analysis

The observed differences occur because:

- Specialized treatments generally cost more.
- Follow-up appointments increase patient spending.
- Departments have different consultation fees.
- Organizational hierarchy influences workload distribution.

---

## Prescriptive Analysis

Hospital management should consider:

- Increasing staffing in high-demand departments.
- Rewarding high-performing doctors.
- Monitoring patients with frequent appointments.
- Reviewing consultation pricing periodically.
- Expanding digital reporting using SQL analytics.

---

# Skills Demonstrated

Throughout this project the following database skills were applied:

- Relational Database Design
- PostgreSQL Programming
- Data Modeling
- SQL Joins
- Primary Keys
- Foreign Keys
- Common Table Expressions
- Recursive Queries
- SQL Window Functions
- Data Analysis
- Database Documentation
- GitHub Repository Management

---

# How to Run the Project

Open PostgreSQL or pgAdmin and execute the SQL files in the following order:

1. `schema.sql`
2. `seed.sql`
3. `part_a_ctes.sql`
4. `part_b_window_functions.sql`

Each query executes independently and demonstrates a different analytical SQL technique.

---

# Future Improvements

Possible future enhancements include:

- Medical records management
- Prescription tracking
- Pharmacy module
- Laboratory module
- Staff management
- Patient authentication
- Dashboard visualization using Power BI or Tableau

---

# References

Elmasri, R., & Navathe, S. B. (2021). *Fundamentals of Database Systems* (7th ed.). Pearson.

PostgreSQL Global Development Group. (2026). *PostgreSQL Documentation*. https://www.postgresql.org/docs/

Silberschatz, A., Korth, H. F., & Sudarshan, S. (2020). *Database System Concepts* (7th ed.). McGraw-Hill.

---

# Academic Integrity Statement

we certify that this project was completed for academic purposes as part of the Database Programming course. The work presented in this repository represents our understanding of relational database design, Common Table Expressions (CTEs), and SQL Window Functions. All external sources used during the development of this project have been appropriately acknowledged and referenced.

---


Database Programming (DPR400210)

2026
