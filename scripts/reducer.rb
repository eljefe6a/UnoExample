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

# Initialize variable to keep track of sums for a suit
cardsum = 0

# Start off with cardsuit as nil
# We have to keep track of the key ourselves
cardsuit = nil

# Iterate through every line passed in to stdin
# Will be key followed by tab then value
ARGF.each do |line|
	line = line.chomp

	# Split the line to key and value based on the tab
	parts = line.split("\t")
	
	if parts.length != 2
		next
	end
	
	# Set the variables up to make them easier to read
	newcardsuit=parts[0]
	cardnum=Integer(parts[1])
		
	if cardsuit.nil?
		# cardsuit not set yet, set it because we keep track of the key
		cardsuit = newcardsuit
	end

	if cardsuit != newcardsuit
		# New cardsuit came in, output the previous suit and sum
		puts cardsuit + "\t" + cardsum.to_s()
		# Set the new key because we keep track of the key
		cardsuit = newcardsuit
		# Set the sum to 0 because there is a new key
		cardsum = 0
	end

	# Add the new card number to the existing card sum
	cardsum = cardsum + cardnum
end

if cardsuit.nil? == false:
	# If a cardsuit was found, output the last key's data before exit
	puts cardsuit + "\t" + cardsum.to_s()
end
