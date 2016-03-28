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

Machine Platform split by year

Output suggests the split between Linux/Windows public AMIs has always been around 99%/1%.
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

Virtualization Type split by year

Output suggests 2016 will be the year hvm takes the lead
```
mysql -h "localhost" "aws_images" < virtualizationtype_by_year.sql

Year    hvm     paravirtual     Total
2009    11      171     		182
2010    607     1964    		2571
2011    641     4000    		4641
2012    1318    9514    		10832
2013    2224    12519   		14743
2014    14942   39571   		54513
2015    63784   123778  		187562
2016    30991   25042   		56033
```
