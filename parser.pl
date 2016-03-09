#/usr/bin/perl -w

use strict;

# set login in ~/.my.cnf

my $file = $ARGV[0];
my $region = substr $file, 0, index $file, ".";  
open(FILE, "< $file" ) or die "Can't open $file : $!";
while(<FILE>)
{
	chomp; # remove end of line character
	my @list = split('\t', $_);   
	my $query = "uspInsertImage (" . "\"$list[0]\"" . ", " . "\"$list[1]\"" . "\"$list[2]\"" . ", " . "\"$list[3]\"" . ", " . "\"$list[4]\"" . ", " . "\"$list[5]\"" . ", ";
	$query .= "\"$list[6]\"" . ", " . "\"$list[7]\"" . ", " . "\"$list[8]\"" . ", " . "\"none\"" . ", " . "\"$region\")";
	# mysql insert query:  mysql -h "localhost" "aws_images" -e "$query"
	print "mysql -e $query";
	die;
}
