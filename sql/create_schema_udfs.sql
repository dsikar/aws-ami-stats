-- USER DEFINED FUNCTIONS

--  1.1 Headers for 1st year (MIN) and last (MAX) : YEAR, Linux (%), Windows(%), Total
--  1.2 For every year in between: YEAR, Linux(%), Windows (%), Total (+-%)
-- TODO charge % to float with two decimal places
DROP FUNCTION IF EXISTS uspDiffYear;

DELIMITER $$
 
CREATE FUNCTION uspDiffYear(diffYear int, col varchar(10)) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
	DECLARE minyear INT;
	DECLARE val1 FLOAT;
	DECLARE val2 FLOAT;
	DECLARE sign char(1); 
    DECLARE strRes varchar(10);

	SELECT MIN(Year) INTO @minyear FROM TMP_PLAT_SBY; -- cleared 0 year in prep script

	IF col = "Linux" THEN
		SELECT Linux INTO @val1 FROM TMP_PLAT_SBY WHERE Year = diffYear;
		SELECT Total INTO @val2 FROM TMP_PLAT_SBY WHERE Year = diffYear;
		SET @val1 = @val1/@val2*100;
		SET strRes = CONCAT("(", Convert(CONVERT(@val1, DECIMAL(4,2)), CHAR), "%)");
		RETURN (strRes);
    ELSEIF col = "Windows" THEN
        SELECT Windows INTO @val1 FROM TMP_PLAT_SBY WHERE Year = diffYear;
        SELECT Total INTO @val2 FROM TMP_PLAT_SBY WHERE Year = diffYear;
        SET @val1 = @val1/@val2*100;
        SET strRes = CONCAT("(", Convert(CONVERT(@val1, DECIMAL(4,2)), CHAR), "%)");
		RETURN (strRes);
    ELSEIF col = "Total" THEN
		IF (diffYear = @minyear) THEN
			SET strRes = "(N/A)";
			RETURN strRes;
		END IF;
        SELECT Total INTO @val1 FROM TMP_PLAT_SBY WHERE Year = diffYear;
        SELECT Total INTO @val2 FROM TMP_PLAT_SBY WHERE Year = diffYear - 1;
        SET @val1 = @val1/@val2*100;
        SET @res = @val1;
        IF @val1 > @val2 THEN
            SET @sign = '+';
        ELSEIF @val1 < @val2 THEN
            SET @sign = '+';
        ELSEIF @va11 = @val2 THEN
            SET @sign = '=';
        END IF;
        SET strRes = CONCAT("(", @sign,  Convert(CONVERT(@val1, SIGNED), CHAR), "%)");
        RETURN (strRes);
	END IF;

	SET strRes = "(N/A)*";
	 
 RETURN (strRes); 
END
$$
