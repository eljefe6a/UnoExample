#!/usr/bin/env ruby

# Initialize variable to keep track of sums for a color
cardsum = 0

# Start off with cardcolor as nil
# We have to keep track of the key ourselves
cardcolor = nil

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
	newcardcolor=parts[0]
	cardnum=Integer(parts[1])
		
	if cardcolor.nil?
		# cardcolor not set yet, set it because we keep track of the key
		cardcolor = newcardcolor
	end

	if cardcolor != newcardcolor
		# New cardcolor came in, output the previous color and sum
		puts cardcolor + "\t" + cardsum.to_s()
		# Set the new key because we keep track of the key
		cardcolor = newcardcolor
		# Set the sum to 0 because there is a new key
		cardsum = 0
	end

	# Add the new card number to the existing card sum
	cardsum = cardsum + cardnum
end

if cardcolor.nil? == false:
	# If a cardcolor was found, output the last key's data before exit
	puts cardcolor + "\t" + cardsum.to_s()
end
