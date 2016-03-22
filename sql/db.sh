#!/bin/bash

sql_scripts_path="$HOME/aws-ami-stats/sql"

# drop database
mysql -e "drop database IF EXISTS aws_images"
 
# create database
mysql -e "create database IF NOT EXISTS aws_images"

# create tables' schema
mysql -h "localhost" "aws_images" < "$sql_scripts_path/create_schema_tables.sql"

# create procs' schema
mysql -h "localhost" "aws_images" < "$sql_scripts_path/create_schema_procs.sql"

