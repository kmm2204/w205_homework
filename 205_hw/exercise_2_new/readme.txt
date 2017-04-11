Exercise 2


1. Start up an instance of the AMI for this lab
AMI Name: UCB MIDS W205 EX2-FULL
AMI ID: ami-d4dd4ec3

2. Install psycopg by running: $ pip install psycopg2==2.6.2

3. Install tweepy: $ pip install tweepy

4. Clone this github repo git clone https://github.com/kmm2204/w205_homework

5. Start posgres

4.  Put your twitter app credentials into the w205_homework/205_hw/exercise_2_new/extweetwordcount/src/spouts/tweets.py

3. Go into the w205_homework/205_hw/exercise_2_new/extweetwordcount/ directory and type sparse run. 

4. Use ctrl +c to stop

5. use python finalresults.py to see all of the words and their counts
or use python finalresults.py <word> to see count for a single word

5. use python histograph.py <x,y> to see a all words in within the range <x,y> of wordcounts
