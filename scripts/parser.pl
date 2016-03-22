#/usr/bin/perl -w

use strict;

################################################# 
#                                               #
# Parse AMI info and build mysql insert scripts #
#                                               #
################################################# 

# NOTE - set mysql login in ~/.my.cnf

my $file = $ARGV[0];
# expecting $file = ~/aws-ami-stats/data/ap-northeast-1.amis
my $offset = length($file) - index(reverse($file), "/");
my $strlen = index($file, ".") - $offset;
my $region = substr($file, $offset, $strlen);  
# expecting $region = ap-northeast-1

my $ami;
open(FILE, "< $file" ) or die "Can't open $file : $!";
while(<FILE>)
{
	chomp; # remove end of line character
	my @list = split('\t', $_);
	if ($#list > 8) {
		$ami = $list[3];
		insert_ami(\@list);
	} else {
		my $code = $list[0];
		my $type = $list[1];
		insert_product_code($ami, $type, $code);
	}
}

# insert ami info
sub insert_ami
{
	my @list = @{$_[0]};
	my $query = "\"call uspInsertImage(" . "\\\"$list[0]\\\"" . ", ";
	$query .= "\\\"$list[1]\\\"" . ", " ."\\\"$list[2]\\\"" . ", ";
	$query .= "\\\"$list[3]\\\"" . ", " . "\\\"$list[4]\\\"";
	$query .= ", " . "\\\"$list[5]\\\"" . ", " . "\\\"$list[6]\\\"";
	$query .= ", " . "\\\"$list[7]\\\"" . ", " . "\\\"$list[8]\\\"";
	$query .= ", " . "\\\"$list[9]\\\"" . ", " . "\\\"$region\\\");\"";
	system("mysql \"aws_images\" -e $query");
}

# update ami info with product code
sub insert_product_code
{
	my ($ami, $type, $code) = @_;
	my $query = "\"call uspUpdateImageProductCode(" . "\\\"$ami\\\"";
	$query .= ", " . "\\\"$type\\\"" . ", " ."\\\"$code\\\");\"";
        system("mysql \"aws_images\" -e $query");
}
