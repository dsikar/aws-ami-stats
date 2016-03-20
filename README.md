AWS Image Stats
==============

Compile current Image (AMI, AKI, ARI) stats  

TODOS

* Pipe describe-images output straight to insert (do not write to file)
* Have tables, write queries

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

