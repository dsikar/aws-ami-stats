#!/bin/bash

#########################################
#                                       #
# Prepare AMI data for every EC2 region #
#                                       #
#########################################

DATA_DIR="$HOME/aws-ami-stats/data"
REG_FILE="$DATA_DIR/regions.txt"
AMI_FILES="$DATA_DIR/*.amis"

# delete region code list if exist
if [ -f "$REG_FILE" ] ; then
	rm -f "$REG_FILE"
fi

# get region code list
aws ec2 describe-regions | awk '{print $3}' >> $REG_FILE

# delete ami files
if [ -f "$AMI_FILES" ] ; then
	rm -f "$AMI_FILES"
fi

# AMI query
query="aws ec2 describe-images --query Images[*].[Architecture,CreationDate,Hypervisor,ImageId,ImageType,Name,OwnerId,RootDeviceType,VirtualizationType,ProductCodes,Platform]"

# get AMI list - this might take a while e.g. tens of minutes.
while read p; do
	date=$(date)
	echo "$date - Getting images for EC2 region $p"
	eval "$query --region $p > $DATA_DIR/$p.amis"
done <$REG_FILE
