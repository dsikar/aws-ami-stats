#/usr/bin/perl -w

use strict;

# set login
my $dbuser = "root";
my $dbpass = "1qaz2wsx";

my $file = $ARGV[0];
my $region = substr $file, 0, index $file, ".";  
open(FILE, "< $file" ) or die "Can't open $file : $!";
while(<FILE>)
{
	chomp; # remove end of line character
	my @list = split('\t', $_);   
	my $query = makeSQL(\@list);
	sqlExec($query);
}

sub makeSQL
{
	my @list = @{$_[0]};
	my $query = "INSERT INTO aws-public-ami.AMI(Architecture,CreationDate,Hypervisor,ImageId,ImageType,Name,OwnerId,RootDeviceType,VirtualizationType,ProductCode,Region)\n";
	$query .= "VALUES (\"$list[0]\", \"$list[1]\", \"$list[2]\", \"$list[3]\", \"$list[4]\", \"$list[5]\", \"$list[6]\", \"$list[7]\", \"$list[8]\", \"$list[9]\", \"$region\")\n";
	return $query;
}

sub sqlExec
{
	my($query) = @_;
	print "mysql -u $dbuser -p$dbpass -e " . $query;
	die;
}

