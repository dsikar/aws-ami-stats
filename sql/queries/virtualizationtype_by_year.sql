-- virtualizationtype_by_year_data.sql must run before this query.

/*
	This query shows the number of public AMIs in AWS
	split by virtualization type; hvm and paravirtual
	TODO create user defined function to get percentage split.
*/

SELECT 
	Year, 
	hvm, 
	udfDiffYearVirt(Year, "hvm") as 'Tot%', 
	paravirtual, 
	udfDiffYearVirt(Year, "paravirtual") as 'Tot%', 
	Total,
	udfDiffYearVirt(Year, "Total") as 'Year inc.'
	FROM TMP_VIRT_SBY ORDER BY Year;
