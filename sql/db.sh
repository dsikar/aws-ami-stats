#!/bin/bash

# create database
mysql -e "create database IF NOT EXISTS aws_images"

# create tables' schema
mysql -h "localhost" "aws_images" < "create_schema_tables.sql"

# create procs' schema
mysql -h "localhost" "aws_images" < "create_schema_procs.sql"

