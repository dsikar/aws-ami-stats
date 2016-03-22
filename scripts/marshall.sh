#!/bin/bash

######################################
#                                    #
# AWS AMI STATS script running order # 
#                                    #
######################################

BASE_DIR="$HOME/aws-ami-stats"

sh "$BASE_DIR/sql/db.sh"

sh "$BASE_DIR/scripts/prep.sh"

sh "$BASE_DIR/scripts/insert.sh"


