-- ============================================================
-- Healthcare SQL Analytics Project — Database Schema
-- Author: Achuo Ransom Kelly | Creative Tech Data Academy (CtDA)
-- Dataset: https://www.kaggle.com/datasets/prasad22/healthcare-dataset
-- ============================================================

-- 1. Core table: one row per hospital admission record
CREATE TABLE patients (
    patient_id         SERIAL PRIMARY KEY,
    name               VARCHAR(100),
    age                INTEGER,
    gender             VARCHAR(10),
    blood_type         VARCHAR(5),
    medical_condition  VARCHAR(50),
    date_of_admission  DATE,
    doctor             VARCHAR(100),
    hospital           VARCHAR(150),
    insurance_provider VARCHAR(100),
    billing_amount     NUMERIC(12,2),
    room_number        INTEGER,
    admission_type     VARCHAR(20),
    discharge_date     DATE,
    medication         VARCHAR(100),
    test_results       VARCHAR(20)
);

-- Note: patient_id is auto-generated (SERIAL) since the source CSV
-- has no unique identifier column. When importing the CSV via
-- pgAdmin's Import/Export tool, patient_id must be UNCHECKED in the
-- Columns tab so PostgreSQL generates it instead of trying to load
-- the "name" column's text into an integer field.

-- 2. Derived column: length of stay in days
ALTER TABLE patients ADD COLUMN length_of_stay INTEGER;

UPDATE patients
SET length_of_stay = discharge_date - date_of_admission;

-- 3. Views — reusable, dashboard-ready summaries

-- Condition-level summary: case volume, average cost, average stay
CREATE VIEW vw_condition_summary AS
SELECT
    medical_condition,
    COUNT(*)                       AS total_cases,
    ROUND(AVG(billing_amount), 2)  AS avg_billing,
    ROUND(AVG(length_of_stay), 1)  AS avg_stay_days
FROM patients
GROUP BY medical_condition;

-- Hospital-level summary: patient volume, average cost, average stay
CREATE VIEW vw_hospital_summary AS
SELECT
    hospital,
    COUNT(*)                       AS total_patients,
    ROUND(AVG(billing_amount), 2)  AS avg_billing,
    ROUND(AVG(length_of_stay), 1)  AS avg_stay_days
FROM patients
GROUP BY hospital;

-- ============================================================
-- End of schema. Run this file first (before importing the CSV)
-- to recreate the table structure and views from scratch.
-- ============================================================
