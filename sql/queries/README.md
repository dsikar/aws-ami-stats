Creating data, user defined funtion and query 
==============

1. Create the data script e.g. ~/aws-ami-stats/sql/queries/architecture_by_year_data.sql  
2. Create the user defined function e.g. ~/aws-ami-stats/sql/create_schema_udf_arch.sql 
3. Create the query script e.g. ~/aws-ami-stats/sql/queries/architecture_by_year.sql   
4. Run script e.g.
```
mysql -h "localhost" "aws_images" < ~/aws-ami-stats/sql/queries/architecture_by_year_data.sql  
mysql -h "localhost" "aws_images" < ~/aws-ami-stats/sql/create_schema_udf_arch.sql
mysql -h "localhost" "aws_images" < ~/aws-ami-stats/sql/queries/architecture_by_year.sql       
```

