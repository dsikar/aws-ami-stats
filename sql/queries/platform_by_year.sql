SELECT 
	PLATFORM_ID, 
	YEAR(CREATIONDATE), 
	Count(*) 
	FROM IMAGES 
	WHERE IMAGETYPE_ID = 2 
	GROUP BY PLATFORM_ID, YEAR(CREATIONDATE) 
	ORDER BY 2;
/*

TODO
1. Change format
	1.1 Headers for 1st year: YEAR, Linux (%), Windows(%), Total 
	1.2 For every following year: YEAR, Linux (% +-%), Windows(% +-%), Total (+-%)

2. Investigate Missing dates

+-------------+--------------------+----------+
| PLATFORM_ID | YEAR(CREATIONDATE) | Count(*) |
+-------------+--------------------+----------+
|           1 |                  0 |     2205 |
|           2 |                  0 |       15 |
|           1 |               2009 |      174 |
|           2 |               2009 |        8 |
|           1 |               2010 |     2539 |
|           2 |               2010 |       32 |
|           2 |               2011 |       13 |
|           1 |               2011 |     4628 |
|           2 |               2012 |       76 |
|           1 |               2012 |    10756 |
|           1 |               2013 |    14564 |
|           2 |               2013 |      179 |
|           2 |               2014 |      293 |
|           1 |               2014 |    54220 |
|           1 |               2015 |   185953 |
|           2 |               2015 |     1609 |
|           1 |               2016 |    55582 |
|           2 |               2016 |      451 |
+-------------+--------------------+----------+

*/
