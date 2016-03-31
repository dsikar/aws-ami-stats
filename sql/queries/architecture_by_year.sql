-- architecture_by_year_data.sql must run before this query.

/*
	This query shows the number of public AMIs in AWS
	split by virtualization type; i386 and x86_64
*/

SELECT 
	Year, 
	i386, 
	udfDiffYearArch(Year, "i386") as 'Tot%', 
	x86_64, 
	udfDiffYearArch(Year, "x86_64") as 'Tot%', 
	Total,
	udfDiffYearArch(Year, "Total") as 'Year inc.'
	FROM TMP_ARCH_SBY ORDER BY Year;
