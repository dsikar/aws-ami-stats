-- platform_by_year_data.sql must run before this query.

/*
	This query shows the number of public AMIs in AWS
	split by Platform; Linux (all distributions available)
	and Windows.
*/

SELECT 
	Year, 
	Linux, 
	uspDiffYear(Year, "Linux") as 'Tot%', 
	Windows, 
	uspDiffYear(Year, "Windows") as 'Tot%', 
	Total,
	uspDiffYear(Year, "Total") as 'Year inc.'
	FROM TMP_PLAT_SBY ORDER BY Year;
