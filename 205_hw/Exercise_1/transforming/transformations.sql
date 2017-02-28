
DROP TABLE hospital_key;

CREATE TABLE hospital_key AS
SELECT DISTINCT
Provider_ID,
Hospital_Name,
State
FROM hospitals;

DROP TABLE measure;

CREATE TABLE measure AS
SELECT
Provider_ID,
Measure_ID,
Measure_Name,
CAST(Score AS FLOAT) as Score
FROM effective_care;

DROP TABlE readmissions_table;

CREATE TABLE IF NOT EXISTS readmissions_table AS
SELECT
Provider_ID,
Measure_ID,
Measure_Name,
CAST(Score AS FLOAT) as Score
FROM readmissions;

DROP TABLE survey;

CREATE TABLE IF NOT EXISTS survey AS
SELECT DISTINCT
Provider_ID,
regexp_replace(HCAHPS_Base_Score, " out of 10", "") as HCAHPS_Base_Score,
regexp_replace(HCAHPS_Consistency_Score, " out of 10", "") as HCAHPS_Consistency_Score
FROM survey_responses;

DROP TABLE hospital_score;

CREATE TABLE IF NOT EXISTS hospital_score AS
SELECT DISTINCT
Provider_Number AS Provider_ID,
CAST(Total_Performance_Score AS FLOAT) AS Total_Performance_Score
FROM top_score;
