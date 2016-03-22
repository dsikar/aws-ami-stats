#!/bin/bash

##############################################
#                                            #
# Pass AMI data to perl script for db insert #
#                                            #
##############################################

DATA_DIR="$HOME/aws-ami-stats/data"
DATA_FILES="$DATA_DIR/DATA_FILES.txt"
SCRIPT_DIR="$HOME/aws-ami-stats/scripts"
# delete region code list if exist
if [ -f "$DATA_FILES" ] ; then
	rm -f "$DATA_FILES"
fi

# get region code list
ls $DATA_DIR/*.amis |  awk '{print $1}' >> $DATA_FILES

# get AMI list - this might take a while e.g. tens of minutes.
while read p; do
	date=$(date)
	echo "$date - Inserting records for region file $p"
	eval "perl $SCRIPT_DIR/parser.pl $p"
done <$DATA_FILES
