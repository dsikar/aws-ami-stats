#/usr/bin/perl -w

use strict;

# set login in ~/.my.cnf

my $file = $ARGV[0];
# expecting ~/aws-ami-stats/data/ap-northeast-1.amis
my $offset = length($file) - index(reverse($file), "/");
my $strlen = index($file, ".") - $offset;
my $region = substr($file, $offset, $strlen);  
# expected ap-northeast-1

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

sub insert_ami
{
	my @list = @{$_[0]};
	#print $#list . "\n";   
	my $query = "\"call uspInsertImage(" . "\\\"$list[0]\\\"" . ", " . "\\\"$list[1]\\\"" . ", " ."\\\"$list[2]\\\"" . ", " . "\\\"$list[3]\\\"" . ", " . "\\\"$list[4]\\\"";
	$query .= ", " . "\\\"$list[5]\\\"" . ", ";
	$query .= "\\\"$list[6]\\\"" . ", " . "\\\"$list[7]\\\"" . ", " . "\\\"$list[8]\\\"" . ", " . "\\\"$list[9]\\\"" . ", "; 
	$query .= "\\\"$region\\\");\"";
	system("mysql \"aws_images\" -e $query");
	#print "$query\n";
	#die;
}

sub insert_product_code
{
	my ($ami, $type, $code) = @_;
	my $query =  "\"call uspUpdateImageProductCode(" . "\\\"$ami\\\"" . ", " . "\\\"$type\\\"" . ", " ."\\\"$code\\\");\"";
        system("mysql \"aws_images\" -e $query");
        #print "$query\n";
}
