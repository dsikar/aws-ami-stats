#!/bin/bash

# create database
mysql -e "create database IF NOT EXISTS aws_images"

# create schema
mysql -h "localhost" "aws_images" < "create_schema.sql"
