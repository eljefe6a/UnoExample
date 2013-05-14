#!/usr/bin/python

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

import sys

# Initialize variable to keep track of sums for a suit
cardsum = 0

# Start off with cardsuit as None
# We have to keep track of the key ourselves
cardsuit = None

# Iterate through every line passed in to stdin
# Will be key followed by tab then value
for input in sys.stdin.readlines():
	input = input.rstrip()
	
	# Split the line to key and value based on the tab
	parts = input.split("\t")

	if len(parts) != 2:
		continue

	# Set the variables up to make them easier to read
	newcardsuit=parts[0]
	cardnum=int(parts[1])

	if not cardsuit: 
		# cardsuit not set yet, set it because we keep track of the key
		cardsuit = newcardsuit

	if cardsuit != newcardsuit:
		# New cardsuit came in, output the previous suit and sum
		print cardsuit + "\t" + str(cardsum)
		# Set the new key because we keep track of the key
		cardsuit = newcardsuit;
		# Set the sum to 0 because there is a new key
		cardsum = 0

	# Add the new card number to the existing card sum
	cardsum = cardsum + cardnum

if cardsuit != None:
	# If a cardsuit was found, output the last key's data before exit
	print cardsuit + "\t" + str(cardsum)
