#!/usr/bin/env perl

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
my $cardsum = 0;

# Start off with cardsuit as undef
# We have to keep track of the key ourselves
my $cardsuit = undef;

# Iterate through every line passed in to stdin
# Will be key followed by tab then value
while (<>) {
	chomp;
	
	# Split the line to key and value based on the tab
	@parts = split(/\t/);
	
	if (length(@parts) != 1) {
		print "Too many parts " . length(@parts) . " Parts:" . @parts[0] . ":" . @parts[1];
		next;
	}
	
	# Set the variables up to make them easier to read
	$newcardsuit = @parts[0];
	$cardnum = @parts[1];
	
	if (!defined($cardsuit)) {
		# cardsuit not set yet, set it because we keep track of the key
		$cardsuit = $newcardsuit;
	}
	
	if ($cardsuit ne $newcardsuit) {
		# New cardsuit came in, output the previous suit and sum
		print $cardsuit . "\t" . $cardsum . "\n";
		# Set the new key because we keep track of the key
		$cardsuit = $newcardsuit;
		# Set the sum to 0 because there is a new key
		$cardsum = 0;
	}
	
	# Add the new card number to the existing card sum
	$cardsum = $cardsum + $cardnum;
}

if (defined($cardsuit)) {
	# If a cardsuit was found, output the last key's data before exit
	print $cardsuit . "\t" . $cardsum . "\n";
}
