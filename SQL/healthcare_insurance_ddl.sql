-- HEALTHCARE INSURANCE ANALYTICS PLATFORM - DATA WAREHOUSE DDL LAYER



CREATE SCHEMA IF NOT EXISTS healthcare_insurance;


CREATE TABLE IF NOT EXISTS healthcare_insurance.disease (
    subgrpid VARCHAR(50),
    disease_id INT,
    disease_name VARCHAR(255)
);




CREATE TABLE IF NOT EXISTS healthcare_insurance.hospital (
    hospital_id VARCHAR(50),
    hospital_name VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS healthcare_insurance.group_table (
    country VARCHAR(100),
    premium_written INT,
    zipcode INT,
    grp_id VARCHAR(50),
    grp_name VARCHAR(255),
    grp_type VARCHAR(100),
    city VARCHAR(100),
    year INT
);


CREATE TABLE IF NOT EXISTS healthcare_insurance.subgroup (
    subgrp_id VARCHAR(50),
    subgrp_name VARCHAR(255),
    monthly_premium INT
);


CREATE TABLE IF NOT EXISTS healthcare_insurance.patients (
    patient_id INT,
    patient_name VARCHAR(255),
    patient_gender VARCHAR(20),
    patient_birth_date TIMESTAMP,
    patient_phone VARCHAR(50),
    disease_name VARCHAR(255),
    city VARCHAR(100),
    hospital_id VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS healthcare_insurance.subscribers (
    sub_id VARCHAR(50),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    street VARCHAR(255),
    birth_date TIMESTAMP,
    gender VARCHAR(20),
    phone VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    zip_code INT,
    subgrp_id VARCHAR(50),
    elig_ind VARCHAR(10),
    eff_date TIMESTAMP,
    term_date TIMESTAMP
);


CREATE TABLE IF NOT EXISTS healthcare_insurance.grpsubgrp (
    subgrp_id VARCHAR(50),
    grp_id VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS healthcare_insurance.claims (
    claim_or_rejected VARCHAR(50),
    sub_id VARCHAR(50),
    claim_amount INT,
    claim_date VARCHAR(50),
    claim_id BIGINT,
    claim_type VARCHAR(100),
    disease_name VARCHAR(255),
    patient_id BIGINT
);


COPY healthcare_insurance.claims 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/claims'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;

SELECT * from healthcare_insurance.claims;

COPY healthcare_insurance.disease 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/disease'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;

COPY healthcare_insurance.group_table 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/group'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;

COPY healthcare_insurance.hospital 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/hospital'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;

COPY healthcare_insurance.patients 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/patients'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;

COPY healthcare_insurance.subscribers 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/subscribers'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;

COPY healthcare_insurance.grpsubgrp 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/grpsubgrp'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;

COPY healthcare_insurance.subgroup 
FROM 's3://healthcare-insurance-bigdata-2026/clean-data/subgroup'
IAM_ROLE 'arn:aws:iam::445448907072:role/redshift-role'
FORMAT AS PARQUET;