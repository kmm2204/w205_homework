import sys
import psycopg2

x=sys.argv
y=x[1].split(',')

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()

cur.execute("SELECT word,count from Tweetwordcount WHERE count>=%s AND count<=%s",(y[0],y[1]))

conn.commit()
s=cur.fetchall()
print s

