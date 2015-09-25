#!/usr/bin/perl
use strict;
use warnings;

#HAPPY.PL (2 Points - Correct)
#Alex Macdonald
#September 24, 2015
#Input: A sequence of integers
#Output: Whether or not the number is "happy" or "unhappy", 
#        and how many steps it took to find that out
#		 A number is "happy" if it resolves to "1"
#        A number is "unhappy" if it repeats a sum of square

#Recieve standard input
my $string = <STDIN>;
chomp($string);

#Declare array to hold the sequence of numbers
my @sequence;
#Split the numbers so each array index is a seperate number
my @input = split(" ", $string);

#Loop for every number we were given
foreach(@input)
{
	#Initialize the array to hold sum of square sequence
	#and push the initial value onto it
	@sequence=();
	my $num = $_;
	push (@sequence, $num);
	
	my $count = 0;
	my $happy = 0;
	my $unhappy = 0;
	#As long as the number is not happy or unhappy
	while ($happy == 0 && $unhappy == 0)
	{
		my @digits = split("", $sequence[$count]);
		my $sumsqr = 0;
		for (my $i = 0; $i < (scalar(@digits)); $i++)
		{
			$sumsqr = $sumsqr + $digits[$i]**2;
		}
		
		#Base Case
		if ($num == 1)
		{
			print "happy 1\n";
			$happy = 1;
		}
		#If the number is happy; 1 is reached
		elsif ($sumsqr == 1)
		{
			print "happy ", scalar(@sequence), "\n";
			$happy = 1;
		}
		else
		{	
			#Do a check for each sum
			foreach(@sequence)
			{
				#If a repeat is found, number is unhappy
				if ($_ == $sumsqr)
				{
					print "unhappy ", scalar(@sequence), "\n";
					$unhappy = 1;
				}
			}
		}
		#Push onto our stack
		push(@sequence, $sumsqr);	
		$count++;
	}
}