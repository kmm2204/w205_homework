--Put HDFS tables string   hospital_comparesurvey_responses
--Table:
DROP TABLE IF EXISTS hospitals;

CREATE TABLE hospitals
(
Provider_ID string,
Hospital_Name string,
Address string,
City string,
State string,
ZIP_Code string,
County_Name string,
Phone_Number string,
Hospital_Type string,
Hospital_Ownership string,
Emergency_Services string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise-1/data/hospitals';




--Create table for effective_care

DROP TABLE IF EXISTS effective_care;

CREATE EXTERNAL TABLE IF NOT EXISTS effective_care
  (Provider_ID string,
    Hospital_Name string,
    Address string,
    City string, State string,
    ZIP_Code string,
    County_Name string,
    Phone_Number string,
    Condition string,
    Measure_ID string,
    Measure_Name string,
    Score string,
    Sample string,
    Footnote string,
    Measure_Start_Date string,
    Measure_End_Date string,
    Location string)
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
    WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
    )
    STORED AS TEXTFILE
  LOCATION '/user/w205/exercise-1/data/effective_care';

--Create table for readmissions

DROP TABLE IF EXISTS readmissions;

CREATE EXTERNAL TABLE IF NOT EXISTS readmissions
  (Provider_ID string,
    Hospital_Name string,
    Address string,
    City string,
    State string,
    ZIP_Code string,
    County_Name string,
    Phone_Number string,
    Measure_Name string,
    Measure_ID string,
    Compared_to_National string,
    Denominator string,
    Score string,
    Lower_Estimate string,
    Higher_Estimate string,
    Footnote string,
    Measure_Start_Date string,
    Measure_End_Date string,
    Location string)
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
    WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
    )
    STORED AS TEXTFILE
  LOCATION '/user/w205/exercise-1/data/readmissions';

--Create table measures
DROP TABLE IF EXISTS measures;

CREATE EXTERNAL TABLE IF NOT EXISTS measures
  (Measure_Name string,
    Measure_ID string,
    Measure_Start_Quarter string,
    Measure_Start_Date string,
    Measure_End_Quarter string,
    Measure_End_Date string,
    Location string)
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
    WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
    )
    STORED AS TEXTFILE
  LOCATION '/user/w205/exercise-1/data/measures';

--Create table
DROP TABLE IF EXISTS survey_responses;

CREATE EXTERNAL TABLE IF NOT EXISTS survey_responses
  (Provider_ID string,
    Hospital_Name string,
    Address string,
    City string,
    State string,
    ZIP_Code string,
    County_Name string,
    Communication_with_Nurses_Achievement_Postrings string,
    Communication_with_Nurses_Dimension_Score string,
    Communication_with_Doctors_Achievement_Postrings string,
    Communication_with_Doctors_Dimension_Score string,
    Responsiveness_of_Hospital_Staff_Achievement_Postrings string,
    Responsiveness_of_Hospital_Staff_Improvement_Postrings string,
    Pain_Management_Achievement_Postrings string,
    Pain_Management_Improvement_Postrings string,
    Pain_Management_Dimension_Score string,
    Communication_about_Medicines_Achievement_Postrings string,
    Communication_about_Medicines_Improvement_Postrings string,
    Communication_about_Medicines_Dimension_Score string,
    Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Postrings string,
    Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Postrings string,
    Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score string,
    Discharge_Information_Achievement_Postrings string,
    Discharge_Information_Improvement_Postrings string,
    Discharge_Information_Dimension_Score string,
    Overall_Rating_of_Hospital_Achievement_Postrings string,
    Overall_Rating_of_Hospital_Improvement_Postrings string,
    Overall_Rating_of_Hospital_Dimension_Score string,
    HCAHPS_Base_Score string,
    HCAHPS_Consistency_Score string)
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
    WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
    )
    STORED AS TEXTFILE
  LOCATION '/user/w205/exercise-1/data/survey_responses';

DROP TABLE IF EXISTS top_score;

CREATE EXTERNAL TABLE IF NOT EXISTS top_score

(Provider_Number string,
  Hospital_Name string,
  Address string,
  City string,
  State string,
  Zip_Code string,
  County_Name string,
  Unweighted_Normalized_Clinical_Process_of_Care_Domain_Score string,
  WeightedstringClinical_Process_of_Care_Domain_Score string,
  Unweighted_Patient_Experience_of_Care_Domain_Score string,
  Weighted_Patient_Experience_of_Care_Domain_Score string,
  Unweighted_Normalized_Outcome_DomainScore string,
  Weighted_Outcome_Domain_Score string,
  Unweighted_Normalized_Efficiency_Domain_Score string,
  Weighted_Efficiency_Domain_Score string,
  Total_Performance_Score string)
  ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
  STORED AS TEXTFILE
LOCATION '/user/w205/exercise-1/data/top_score';
