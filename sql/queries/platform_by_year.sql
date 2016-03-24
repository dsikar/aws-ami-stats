
-- PLATFORM SPLIT BY YEAR

SELECT y.YEAR, l.Linux, w.Windows, t.Total
	FROM 
	(
		SELECT 
		DISTINCT YEAR(CREATIONDATE) AS `YEAR` 
		FROM IMAGES a
		WHERE YEAR(CREATIONDATE) > 0
 	) y,
	(
		SELECT 
		DISTINCT YEAR(CREATIONDATE) AS `YEAR`, COUNT(*) as Linux 
		FROM IMAGES a
		INNER JOIN PLATFORM b
		ON a.PLATFORM_ID = b.ID
		INNER JOIN IMAGETYPE c
        ON a.IMAGETYPE_ID = c.ID
		WHERE b.TYPE = 'None' -- Linux
		AND c.TYPE = 'Machine' -- AMI
		GROUP BY 1
 	) l,
	(
		SELECT 
		DISTINCT YEAR(CREATIONDATE) AS `YEAR`, COUNT(*) as Windows
		FROM IMAGES a
		INNER JOIN PLATFORM b
		ON a.PLATFORM_ID = b.ID
		INNER JOIN IMAGETYPE c
        ON a.IMAGETYPE_ID = c.ID
		WHERE b.TYPE = 'windows' -- Windows
		AND c.TYPE = 'Machine' -- AMI
		GROUP BY 1
 	) w,
	(
		SELECT 
		DISTINCT YEAR(CREATIONDATE) AS `YEAR`, COUNT(*) as Total
		FROM IMAGES a
		INNER JOIN PLATFORM b
		ON a.PLATFORM_ID = b.ID
		INNER JOIN IMAGETYPE c
        ON a.IMAGETYPE_ID = c.ID
		WHERE c.TYPE = 'Machine' -- AMI
		GROUP BY 1
 	) t
WHERE y.YEAR = l.YEAR
AND y.YEAR = w.YEAR
AND y.YEAR = t.YEAR
ORDER BY 1


/*

TODO
1. Change format
	1.1 Headers for 1st year (MIN) and last (MAX) : YEAR, Linux (%), Windows(%), Total 
	1.2 For every year in between: YEAR, Linux (% +-%), Windows(% +-%), Total (+-%)

2. Investigate Missing dates


