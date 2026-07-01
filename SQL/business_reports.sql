-- Create the dedicated Output Folder (Schema)
CREATE SCHEMA IF NOT EXISTS project_output;

-- 1. Which disease has a maximum number of claims
CREATE TABLE IF NOT EXISTS project_output.max_disease_claims AS 
SELECT disease_name, COUNT(claim_id) as total_claims
FROM healthcare_insurance.claims
WHERE claim_or_rejected = 'Y'
GROUP BY disease_name
ORDER BY total_claims DESC
LIMIT 1;

-- 2. Find those Subscribers having age less than 30
CREATE TABLE IF NOT EXISTS project_output.subscribers_under_30 AS
SELECT sub_id, first_name, last_name, birth_date, subgrp_id
FROM healthcare_insurance.subscribers
WHERE DATEDIFF(year, birth_date, '2026-01-01'::timestamp) < 30
  AND subgrp_id IS NOT NULL AND subgrp_id != 'NaN';

-- 3. Find out which group has maximum subgroups
CREATE TABLE IF NOT EXISTS project_output.group_max_subgroups AS
SELECT grp_id, COUNT(subgrp_id) as total_subgroups
FROM healthcare_insurance.grpsubgrp
GROUP BY grp_id
ORDER BY total_subgroups DESC
LIMIT 1;

-- 4. Find out hospital which serve most number of patients
CREATE TABLE IF NOT EXISTS project_output.top_hospital_patients AS
SELECT h.hospital_name, COUNT(p.patient_id) as total_patients
FROM healthcare_insurance.hospital h
JOIN healthcare_insurance.patients p ON h.hospital_id = p.hospital_id
GROUP BY h.hospital_name
ORDER BY total_patients DESC
LIMIT 1;

-- 5. Find out which subgroups subscribe most number of times
CREATE TABLE IF NOT EXISTS project_output.top_subscribed_subgroups AS
SELECT subgrp_id, COUNT(sub_id) as total_subscriptions
FROM healthcare_insurance.subscribers
WHERE subgrp_id IS NOT NULL AND subgrp_id != 'NaN'
GROUP BY subgrp_id
ORDER BY total_subscriptions DESC
LIMIT 1;

-- 6. Find out total number of claims which were rejected
CREATE TABLE IF NOT EXISTS project_output.rejected_claims_count AS
SELECT COUNT(claim_id) as total_rejected_claims
FROM healthcare_insurance.claims
WHERE claim_or_rejected IS NULL OR claim_or_rejected = 'NaN';

-- 7. From where most claims are coming (city)
CREATE TABLE IF NOT EXISTS project_output.top_claim_cities AS
SELECT s.city, COUNT(c.claim_id) as total_claims
FROM healthcare_insurance.subscribers s
JOIN healthcare_insurance.claims c ON s.sub_id = c.sub_id
GROUP BY s.city
ORDER BY total_claims DESC
LIMIT 1;

-- 8. Which groups of policies subscriber subscribe mostly Government or private
CREATE TABLE IF NOT EXISTS project_output.most_subscribed_policy_type AS
SELECT g.grp_type as policy_type, COUNT(s.sub_id) as total_subscriptions
FROM healthcare_insurance.group_table g
JOIN healthcare_insurance.grpsubgrp gs ON g.grp_id = gs.grp_id
JOIN healthcare_insurance.subscribers s ON gs.subgrp_id = s.subgrp_id
GROUP BY g.grp_type
ORDER BY total_subscriptions DESC
LIMIT 1;

-- 9. Average monthly premium subscriber pay to insurance company
CREATE TABLE IF NOT EXISTS project_output.avg_monthly_premium AS
SELECT AVG(monthly_premium) as overall_average_premium
FROM healthcare_insurance.subgroup;

-- 10. Find out Which group is most profitable
CREATE TABLE IF NOT EXISTS project_output.most_profitable_group AS
SELECT g.grp_id, (SUM(sg.monthly_premium) - COALESCE(SUM(c.claim_amount), 0)) as calculated_profit
FROM healthcare_insurance.group_table g
JOIN healthcare_insurance.grpsubgrp gs ON g.grp_id = gs.grp_id
JOIN healthcare_insurance.subgroup sg ON gs.subgrp_id = sg.subgrp_id
LEFT JOIN healthcare_insurance.subscribers s ON sg.subgrp_id = s.subgrp_id
LEFT JOIN healthcare_insurance.claims c ON s.sub_id = c.sub_id AND c.claim_or_rejected = 'Y'
GROUP BY g.grp_id
ORDER BY calculated_profit DESC
LIMIT 1;

-- 11. List all the patients below age of 18 who admit for cancer
CREATE TABLE IF NOT EXISTS project_output.minor_cancer_patients AS
SELECT patient_id, patient_name, patient_birth_date, disease_name
FROM healthcare_insurance.patients
WHERE DATEDIFF(year, patient_birth_date, '2026-01-01'::timestamp) < 18
  AND LOWER(disease_name) LIKE '%cancer%';

-- 12. List patients who have cashless insurance and have total charges >= 50,000
DROP TABLE IF EXISTS project_output.cashless_high_charges;
CREATE TABLE project_output.cashless_high_charges AS
SELECT p.patient_id, p.patient_name, c.claim_type, c.claim_amount as total_charges
FROM healthcare_insurance.patients p
JOIN healthcare_insurance.claims c ON p.patient_id = c.patient_id
WHERE (LOWER(c.claim_type) LIKE '%cashless%' OR LOWER(c.claim_type) LIKE '%policy%')
  AND c.claim_amount >= 50000;

-- 13. List female patients over 40 that have undergone knee surgery
DROP TABLE IF EXISTS project_output.female_knee_surgery_over_40;
CREATE TABLE project_output.female_knee_surgery_over_40 AS
SELECT patient_id, patient_name, patient_gender as gender, patient_birth_date, disease_name
FROM healthcare_insurance.patients
WHERE LOWER(patient_gender) = 'female'
  AND DATEDIFF(year, patient_birth_date, '2026-01-01'::timestamp) > 40
  AND (LOWER(disease_name) LIKE '%knee%' OR LOWER(disease_name) LIKE '%surgery%');