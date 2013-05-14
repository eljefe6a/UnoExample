#!/usr/bin/python

# To run in Hadoop cluster
# hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming*.jar -input cardinput.txt -output output -mapper mapper.py -reducer reducer.py -file mapper.py -file reducer.py

# To run without Hadoop for debugging purposes
# hadoop fs -cat cardinput.txt | ./mapper.py | sort | ./reducer.py
import re
import sys

# Create regular expression to catch bad data
cardinput = re.compile("(.*) (\d+)")

# Iterate through every line passed in to stdin
for input in sys.stdin.readlines():
	match = cardinput.match(input)
	
	if match:
		# Line matches regex, output to reducer
		print match.group(1).lower() + '\t' + match.group(2)
