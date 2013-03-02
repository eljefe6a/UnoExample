#!/usr/bin/env perl

# To run in Hadoop cluster
# hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming*.jar -input unoinput.txt -output output -mapper mapper.pl -reducer reducer.pl -file mapper.pl -file reducer.pl

# To run without Hadoop for debugging purposes
# hadoop fs -cat unoinput.txt | ./mapper.pl | sort | ./reducer.pl

# Iterate through every line passed in to stdin
while (<>) {
	chomp;
	
	if (/(.*) (\d+)/) {
		# Line matches regex, output to reducer
		print lc $1 . "\t$2\n";
	}
}
