#!/bin/bash

#########################################
#                                       #
# Prepare AMI data for every EC2 region #
#                                       #
#########################################

data_files="$HOME/aws-ami-stats/data/data_files.txt"
data_folder="$HOME/aws-ami-stats/data"
# delete region code list if exist
if [ -f "$data_files" ] ; then
	rm -f "$data_files"
fi

# get region code list
ls $data_folder/*.amis |  awk '{print $1}' >> $data_files

# get AMI list - this might take a while e.g. tens of minutes.
while read p; do
	date=$(date)
	echo "$date - Inserting records for region file $p"
	eval "perl parser.pl $p"
done <$data_files
