#!/bin/bash

#########################################
#                                       #
# Prepare AMI data for every EC2 region #
#                                       #
#########################################

reg_file="$HOME/regions.txt"
data_folder="$HOME/data"
# delete region code list if exist
if [ -f "$reg_file" ] ; then
	rm -f "$reg_file"
fi

# get region code list
aws ec2 describe-regions | awk '{print $3}' >> ~/regions.txt

# AMI query
query="aws ec2 describe-images --query Images[*].[Architecture,CreationDate,Hypervisor,ImageId,ImageType,Name,OwnerId,RootDeviceType,VirtualizationType,ProductCodes,Platform]"

# get AMI list - this might take a while e.g. tens of minutes.
while read p; do
	date=$(date)
	echo "$date - Getting images for EC2 region $p"
	eval "$query --region $p > $data_folder/$p.amis"
done <$reg_file
