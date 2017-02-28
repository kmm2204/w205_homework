#Go to the data directory
cd /data
#make a directory for exercise 1
mkdir /data/exercise-1
cd /data/exercise-1
mkdir /hospital_files
mkdir /data/exercise-1/hospital_files

#get files and unzip them
wget -O Hospital_Flatfiles.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
mv "Hospital_Flatfiles.zip" hospital_files
cd hospital_files
unzip "Hospital_Flatfiles.zip"

#strip headers
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > measures.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv" >survey_responses.csv
tail -n +2 "hvbp_tps_05_28_2015.csv" >top_score.csv

#make directories in the hdfs
hdfs dfs -mkdir /user/w205/exercise-1
hdfs dfs -mkdir /user/w205/exercise-1/data
hdfs dfs -mkdir /user/w205/exercise-1/data/hospitals
hdfs dfs -mkdir /user/w205/exercise-1/data/effective_care
hdfs dfs -mkdir /user/w205/exercise-1/data/readmissions
hdfs dfs -mkdir /user/w205/exercise-1/data/measures
hdfs dfs -mkdir /user/w205/exercise-1/data/survey_responses
hdfs dfs -mkdir /user/w205/exercise-1/data/top_score

#move the files to the hdfs
hdfs dfs -put /data/exercise-1/hospital_files/hospitals.csv /user/w205/exercise-1/data/hospitals
#hdfs dfs -ls /user/w205/exercise-1/data/hospitals
hdfs dfs -put /data/exercise-1/hospital_files/effective_care.csv /user/w205/exercise-1/data/effective_care
#hdfs dfs -ls /user/w205/exercise-1/data/effective_care
hdfs dfs -put /data/exercise-1/hospital_files/readmissions.csv /user/w205/exercise-1/data/readmissions
#hdfs dfs -ls /user/w205/exercise-1/data/readmissions
hdfs dfs -put /data/exercise-1/hospital_files/measures.csv /user/w205/exercise-1/data/measures
#hdfs dfs -ls /user/w205/exercise-1/data/measures
hdfs dfs -put /data/exercise-1/hospital_files/survey_responses.csv /user/w205/exercise-1/data/survey_responses
#hdfs dfs -ls /user/w205/exercise-1/data/survey_responses
hdfs dfs -put /data/exercise-1/hospital_files/top_score.csv /user/w205/exercise-1/data/top_score
#hdfs dfs -ls /user/w205/exercise-1/data/top_score
