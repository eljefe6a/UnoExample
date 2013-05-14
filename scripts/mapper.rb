#!/usr/bin/env ruby

# Copyright 2013 Jesse Anderson
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# To run in Hadoop cluster
# hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming*.jar -input cardinput.txt -output output -mapper mapper.rb -reducer reducer.rb -file mapper.rb -file reducer.rb

# To run without Hadoop for debugging purposes
# hadoop fs -cat cardinput.txt | ./mapper.rb | sort | ./reducer.rb

# Iterate through every line passed in to stdin
ARGF.each do |line|
	line = line.chomp

	if match = line.match(/(.*) (\d+)/)
		# Line matches regex, output to reducer
		key, value = match.captures
		
		puts key.downcase + "\t" + value
	end
end
