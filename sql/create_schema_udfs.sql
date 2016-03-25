-- USER DEFINED FUNCTIONS

--  1.1 Headers for 1st year (MIN) and last (MAX) : YEAR, Linux (%), Windows(%), Total
--  1.2 For every year in between: YEAR, Linux (% +-%), Windows(% +-%), Total (+-%)
DROP FUNCTION IF EXISTS uspDiffYear;

DELIMITER $$
 
CREATE FUNCTION uspDiffYear(diffYear int) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    DECLARE strRes varchar(10);
 	SET strRes = "(+ 28%)";
	 
 RETURN (strRes);
END
$$
