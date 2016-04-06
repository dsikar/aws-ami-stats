
-- REGIONNAME SPLIT BY YEAR - GENERATE DATA

DROP TABLE IF EXISTS TMP_RGN_SBY;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `TMP_RGN_SBY` (
  Year int(11) NOT NULL,
  Name varchar(16) NOT NULL,
  rgn_cnt int(11) NOT NULL,
  Total int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

INSERT INTO TMP_RGN_SBY (Year, Name, rgn_cnt, Total) 
SELECT y.YEAR, r.Name, r.rgn_cnt, t.Total
	FROM 
	(
		SELECT 
		DISTINCT YEAR(CREATIONDATE) AS `YEAR` 
		FROM IMAGES a
		WHERE YEAR(CREATIONDATE) > 0
 	) y,
	(
		SELECT 
		DISTINCT YEAR(CREATIONDATE) AS `YEAR`, b.Name, COUNT(*) as rgn_cnt
		FROM IMAGES a
		INNER JOIN REGIONNAME b
		ON a.REGIONCODE_ID = b.ID
		INNER JOIN IMAGETYPE c
        ON a.IMAGETYPE_ID = c.ID
		AND c.TYPE = 'Machine' -- AMI
		GROUP BY 1,2
 	) r,
	(
		SELECT 
		DISTINCT YEAR(CREATIONDATE) AS `YEAR`, COUNT(*) as Total
		FROM IMAGES a
		INNER JOIN REGIONNAME b
		ON a.REGIONCODE_ID = b.ID
		INNER JOIN IMAGETYPE c
        ON a.IMAGETYPE_ID = c.ID
		WHERE c.TYPE = 'Machine' -- AMI
		GROUP BY 1
 	) t
WHERE y.YEAR = r.YEAR
AND y.YEAR = t.YEAR
ORDER BY 1;


