# Healthcare-Analytics-
Healthcare Data Analytics (PostgreSQL + pgAdmin)
Overview
A SQL-based data analytics project exploring a synthetic 55,500-record
healthcare dataset from Kaggle. The project covers the full analytics
workflow inside PostgreSQL: schema design, data import, cleaning,
exploratory analysis, aggregation, time-series analysis, window
functions, and reusable views — all executed and verified in pgAdmin.
Dataset
Source: Healthcare Dataset — Kaggle
Size: 55,500 hospital admission records
Fields: patient demographics (name, age, gender, blood type),
medical condition, admission/discharge dates, attending doctor,
hospital, insurance provider, billing amount, room number,
admission type, medication, and test results.
Note: This is a synthetic dataset generated with Python's Faker
library for analytics practice. It contains no real patient data.
Tools Used
PostgreSQL (database engine)
pgAdmin (query execution, CSV import, schema management)
Project Structure
Code
How to Reproduce
Create a PostgreSQL database (e.g. health_analytics).
Run schema.sql in pgAdmin's Query Tool to create the patients
table and its views.
Download the CSV from the Kaggle link above.
Import it via pgAdmin: right-click the patients table →
Import/Export Data → Import. Set Header to Yes, and in the
Columns tab, uncheck patient_id so PostgreSQL auto-generates
it instead of trying to load the name column into an integer field.
Run the scripts in /queries in numeric order.
Key Findings
(Fill in with your actual results from the queries you ran)
The most common medical condition is ___, accounting for ___ cases.
The most expensive condition to treat on average is ___, at $___ per admission.
Hospital ___ has the highest patient volume; Hospital ___ has the longest average stay.
Admissions peak in ___ (month) / on ___ (day of week).
Insurance provider ___ covers the largest share of patients.
A small number of records (see 02_cleaning.sql) share identical
name/date/hospital combinations — a known characteristic of this
synthetic dataset rather than an import error.
Skills Demonstrated
Relational schema design (CREATE TABLE, data types, primary keys)
Bulk data import via COPY / pgAdmin's Import/Export tool
Data cleaning: text normalization, null/duplicate checks, integrity validation
Aggregation with GROUP BY, HAVING, and multiple aggregate functions
Date/time analysis with DATE_TRUNC, EXTRACT, and TO_CHAR
Window functions: RANK() OVER (PARTITION BY ...), running totals, percentage-of-total
Views for a reusable, dashboard-ready data layer
Author
Achuo Ransom Kelly
Founder, Creative Tech Data Academy (CtDA) — Bamenda, Cameroon
Data Analyst | Educator | EdTech Builder
