--high quality care hospitals

SELECT
a.Provider_ID,
a.Total_Performance_Score,
b.Hospital_Name,
b.State
FROM hospital_score a
JOIN hospital_key b ON (a.Provider_ID= b.Provider_ID)
GROUP BY
a.Provider_ID,
b.Hospital_Name,
b.State,
a.Total_Performance_Score
ORDER BY Total_Performance_Score DESC
LIMIT 10;

--State
SELECT
a.Total_Performance_Score,
b.State
FROM hospital_score a
JOIN hospital_key b ON (a.Provider_ID= b.Provider_ID)
GROUP BY
b.State,
a.Total_Performance_Score
ORDER BY Total_Performance_Score DESC
LIMIT 10;

--variable procedures
SELECT
a.Measure_ID,
a.Measure_Name,
Max(a.Score),
Min(a.Score),
Max(a.Score) - Min(a.Score) AS score_range
FROM readmissions_table a
JOIN hospital_key b ON (a.Provider_ID= b.Provider_ID)
GROUP BY
a.Measure_ID,
a.Measure_Name
ORDER BY score_range DESC
LIMIT 10;

--hospital quality and patient survey Responses correlation

select (count(*) * sum(a.Total_Performance_Score * b.HCAHPS_Base_Score) - sum(a.Total_Performance_Score) * sum(b.HCAHPS_Base_Score)) /
(sqrt(count(*) * sum(a.Total_Performance_Score * a.Total_Performance_Score) - sum(a.Total_Performance_Score) * sum(a.Total_Performance_Score)) *
sqrt(count(*) * sum(b.HCAHPS_Base_Score * b.HCAHPS_Base_Score) - sum(b.HCAHPS_Base_Score) * sum(b.HCAHPS_Base_Score)))
FROM hospital_score a
JOIN survey b on (a.Provider_ID = b.Provider_ID)

--procedural variability and patient survey responses correlation
--#Hmm is there a way to use max/min because I need this for range.  I need to define this beforehand in a new table.
--#select
--#Max(a.Score) - Min(a.Score) AS a.score_range
--#(count(*) * sum(Max(a.Score) - Min(a.Score) * y) - sum(Max(a.Score) - Min(a.Score)) * sum(b.HCAHPS_Base_Score)) /
--#(sqrt(count(*) * sum(Max(a.Score) - Min(a.Score) * Max(a.Score) - Min(a.Score)) - sum(Max(a.Score) - Min(a.Score)) * sum(Max(a.Score) - Min(a.Score))) *
--#sqrt(count(*) * sum(b.HCAHPS_Base_Score * b.HCAHPS_Base_Score) - sum(b.HCAHPS_Base_Score) * sum(b.HCAHPS_Base_Score)))
--#FROM readmissions_table a
--#JOIN survey b on (a.Provider_ID = b.Provider_ID);
