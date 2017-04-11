import sys
import  psycopg2.extensions

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv) == 1:
        cur.execute("SELECT word, count from Tweetwordcount")
        conn.commit()
        s=cur.fetchall()
        print s

elif len(sys.argv) == 2:
        cur.execute("SELECT count from Tweetwordcount WHERE word=%s;" , [sys.argv[1]])
        conn.commit()
        number=cur.fetchone()
        if number==None:
                s="Total number of occurance of"+repr(sys.argv[1])+": 0"
                print s
        else:
             	s="Total number of occurances of"+repr(sys.argv[1])+":"+repr(number[0])
                print s

else:
     	print "incorrect number of arguments"
