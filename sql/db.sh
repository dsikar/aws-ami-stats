#!/bin/bash

# create database
mysql -u root -p1qaz2wsx -e "create database IF NOT EXISTS aws_images"

# create schema
mysql -h "localhost" -u "root" "-p1qaz2wsx" "aws_images" < "create_schema.sql"
