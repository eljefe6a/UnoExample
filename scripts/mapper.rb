#!/usr/bin/env ruby

# To run in Hadoop cluster
# hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming*.jar -input unoinput.txt -output output -mapper mapper.rb -reducer reducer.rb -file mapper.rb -file reducer.rb

# To run without Hadoop for debugging purposes
# hadoop fs -cat unoinput.txt | ./mapper.rb | sort | ./reducer.rb

# Iterate through every line passed in to stdin
ARGF.each do |line|
	line = line.chomp

	if match = line.match(/(.*) (\d+)/)
		# Line matches regex, output to reducer
		key, value = match.captures
		
		puts key.downcase + "\t" + value
	end
end
