#!/usr/bin/env perl

# Initialize variable to keep track of sums for a color
my $cardsum = 0;

# Start off with cardcolor as undef
# We have to keep track of the key ourselves
my $cardcolor = undef;

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
	$newcardcolor = @parts[0];
	$cardnum = @parts[1];
	
	if (!defined($cardcolor)) {
		# cardcolor not set yet, set it because we keep track of the key
		$cardcolor = $newcardcolor;
	}
	
	if ($cardcolor ne $newcardcolor) {
		# New cardcolor came in, output the previous color and sum
		print $cardcolor . "\t" . $cardsum . "\n";
		# Set the new key because we keep track of the key
		$cardcolor = $newcardcolor;
		# Set the sum to 0 because there is a new key
		$cardsum = 0;
	}
	
	# Add the new card number to the existing card sum
	$cardsum = $cardsum + $cardnum;
}

if (defined($cardcolor)) {
	# If a cardcolor was found, output the last key's data before exit
	print $cardcolor . "\t" . $cardsum . "\n";
}
