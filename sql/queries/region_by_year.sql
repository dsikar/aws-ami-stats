-- region_by_year_data.sql must run before this query.

/*
	This query shows the number of public AMIs in AWS
	split by region and year.
*/


-- 1. Sub-query with all years and totals
/*

SELECT 
	a.Year, 
	a.Total
	FROM
	(
	SELECT DISTINCT
		Year,
		Total
		FROM TMP_RGN_SBY
	) a
	ORDER BY 1;
i*/

-- 2. Sub-query with all names, ami counts and years

SELECT
	Year,
	Name,
	rgn_cnt
	FROM TMP_RGN_SBY
	ORDER BY 1;
/*
SELECT 
	Year, 
	hvm, 
	udfDiffYearVirt(Year, "hvm") as 'Tot%', 
	paravirtual, 
	udfDiffYearVirt(Year, "paravirtual") as 'Tot%', 
	Total,
	udfDiffYearVirt(Year, "Total") as 'Year inc.'
	FROM TMP_VIRT_SBY ORDER BY Year;
*/
