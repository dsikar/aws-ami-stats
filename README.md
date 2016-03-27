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

* QUERIES

Machine Platform splits by year

Show the split between public AMIs by platform.
```
mysql -h "localhost" "aws_images" < ~/aws-ami-stats/sql/queries/platform_by_year.sql

Year    Linux   Tot%    		Windows Tot%    Total   Year inc.
2009    174     (95.60%)        8       (4.40%) 182     (N/A)
2010    2539    (98.76%)        32      (1.24%) 2571    (+1413%)
2011    4628    (99.72%)        13      (0.28%) 4641    (+181%)
2012    10756   (99.30%)        76      (0.70%) 10832   (+233%)
2013    14564   (98.79%)        179     (1.21%) 14743   (+136%)
2014    54220   (99.46%)        293     (0.54%) 54513   (+370%)
2015    185953  (99.14%)        1609    (0.86%) 187562  (+344%)
2016    55582   (99.20%)        451     (0.80%) 56033   (+30%)
```
