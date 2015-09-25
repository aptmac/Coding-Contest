#!/usr/bin/perl
use strict;
use warnings;

#BUBBLE SORT (1 Point)- Correct
#Alex Macdonald
#September 24, 2015

my $input = <STDIN>;
chomp($input);

my @numbers = split(" ", $input);

#Size of the array
my $size = scalar(@numbers);

#Number of swaps required to sort
my $swaps = 0;

#Declare $continue to be > 0 just to enter the loop
#Ensures the loop executes at least once
my $continue = 1;

#Loop while we don't have to continue (sorted array $continue = 0)
while ($continue > 0)
{
	#Set $continue to 0
	$continue = 0;
	#Declare counter varibles
	my $i = 0;
	my $j = 1;
	
	#Loop through each array location and compare it's neighbouring regions
	for (my $l = 0; $l < ($size - 1); $l++)
	{
		if ($numbers[$i] > $numbers[$j])
		{
			#Swap the values
			$swaps++;
			my $temp = $numbers[$i];
			$numbers[$i] = $numbers[$j];
			$numbers[$j] = $temp;
		}
		$i++;
		$j++;
	}
	
	#CHECK THE ORDER
	#Re-initialize $i and $j to check if our array is in sorted order
	$i = 0;
	$j = 1;
	for (my $k = 0; $k < ($size - 1); $k++)
	{
		if ($numbers[$i] > $numbers[$j])
		{
			#If a swap is required, trigger a continue
			$continue++;
		}
		$i++;
		$j++;
	}
}
print $swaps."\n";
print "@numbers\n";