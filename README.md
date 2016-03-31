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

Output suggests 2016 will be the year hvm takes the lead.
```
mysql -h "localhost" "aws_images" < ~/aws-ami-stats/sql/queries/queries/virtualizationtype_by_year.sql

Year    hvm     Tot%    	paravirtual     Tot%    		Total   Year inc.
2009    11      (6.04%) 	171    			(93.96%)        182     (N/A)
2010    607     (23.61%)    1964   			(76.39%)        2571    (+1413%)
2011    641     (13.81%)    4000   			(86.19%)        4641    (+181%)
2012    1318    (12.17%)    9514   			(87.83%)        10832   (+233%)
2013    2224    (15.09%)    12519  			(84.91%)        14743   (+136%)
2014    14942   (27.41%)    39571  			(72.59%)        54513   (+370%)
2015    63784   (34.01%)    123778 			(65.99%)        187562  (+344%)
2016    30991   (55.31%)    25042  			(44.69%)        56033   (+30%)
```

Architecture split by year  

Output suggests 64 bit took over from 2013.
```
mysql -h "localhost" "aws_images" < ~/aws-ami-stats/sql/queries/architecture_by_year_data.sql

Year    i386    Tot%    		x86_64  Tot%    		Total   Year inc.
2009    113     (62.09%)        69      (37.91%)        182     (N/A)
2010    1260    (49.01%)        1311    (50.99%)        2571    (+1413%)
2011    2236    (48.18%)        2405    (51.82%)        4641    (+181%)
2012    5303    (48.96%)        5529    (51.04%)        10832   (+233%)
2013    4461    (30.26%)        10282   (69.74%)        14743   (+136%)
2014    14651   (26.88%)        39862   (73.12%)        54513   (+370%)
2015    51972   (27.71%)        135590  (72.29%)        187562  (+344%)
2016    8695    (15.52%)        47338   (84.48%)        56033   (+30%)
