drop procedure if exists uspInsertImage;
DELIMITER %%
CREATE PROCEDURE uspInsertImage(arch VARCHAR(6), cd char(24), hv char(3), 
				ii varchar(21), it varchar(7), iname varchar(120), 
				ownid varchar(18), rdt varchar(14), vt varchar(11),  
				pc varchar(50), rg varchar(14))
BEGIN

	DECLARE parsed_cd char(19);
	-- Expected Format: 2010-08-16T23:18:19.000Z 
	SET parsed_cd = CONCAT(SUBSTRING(cd, 1, 10), " ", SUBSTRING(cd, 12, 8));
	INSERT INTO IMAGES (ARCHITECTURE,CREATIONDATE,HYPERVISOR,IMAGEID,IMAGETYPE,NAME,OWNERID,ROOTDEVICETYPE,VIRTUALIZATIONTYPE,PRODUCTCODE,REGIONCODE)
	VALUES (arch, parsed_cd, hv, ii, it, iname, ownid, rdt, vt, pc, rg);

END
%%

DELIMITER ;

