AWS Image Stats
==============

Current Image (AMI, AKI, ARI) stats based on data available through
the AWS CLI.  

* TODO write script creation sequence

Resulting Tables

```
mysql "aws_images" -e "show tables"

+----------------------+
| Tables_in_aws_images |
+----------------------+
| ARCHITECTURE         |
| HYPERVISOR           |
| IMAGES               |
| IMAGETYPE            |
| PLATFORM             |
| PRODUCTCODETYPE      |
| REGIONNAME           |
| ROOTDEVICETYPE       |
| VIRTUALIZATIONTYPE   |
+----------------------+
```

Machine Platform splits by year

```
mysql -h "localhost" "aws_images" < ~/aws-ami-stats/sql/queries/platform_by_year.sql

YEAR    Linux   Windows Total
2009    174     8       182
2010    2539    32      2571
2011    4628    13      4641
2012    10756   76      10832
2013    14564   179     14743
2014    54220   293     54513
2015    185953  1609    187562
2016    55582   451     56033
```
