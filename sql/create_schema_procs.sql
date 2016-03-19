drop procedure if exists uspInsertImage;
DELIMITER %%
CREATE PROCEDURE uspInsertImage(arch VARCHAR(6), cd char(24), hv char(3), 
				ii varchar(21), it varchar(7), iname varchar(120), 
				ownid varchar(18), rdt varchar(14), vt varchar(11),  
				pt varchar(7), rg varchar(14))
BEGIN

	DECLARE arch_id INT;
	DECLARE parsed_cd char(19);

	-- ARCHITECTURE ID LOOKUP
	SET arch_id = (SELECT ID FROM ARCHITECTURE WHERE TYPo = arch);
	IF arch_id IS NULL THEN	
                INSERT INTO ARCHITECTURE (`TYPE`)
                VALUES (arch);
                SET arch_id = @@IDENTITY;
        END IF;		
	-- CREATION DATE
	-- Expected Format: 2010-08-16T23:18:19.000Z 
	SET parsed_cd = CONCAT(SUBSTRING(cd, 1, 10), " ", SUBSTRING(cd, 12, 8));

	-- TODO remaining columns
	INSERT INTO IMAGES (ARCHITECTURE_ID,CREATIONDATE) -- ,HYPERVISOR_ID,IMAGEID,IMAGETYPE_ID,NAME,OWNERID,ROOTDEVICETYPE_ID,VIRTUALIZATIONTYPE_ID,PLATFORM_ID,REGIONCODE_ID)
	VALUES (arch_id, parsed_cd); -- , hv_id, ii, it_id, iname, ownid, rdt_id, vt_id, pt_id, rg_id);

END
%%

DELIMITER ;

drop procedure if exists uspUpdateImageProductCode;
DELIMITER %%
CREATE PROCEDURE uspUpdateImageProductCode(ami_id VARCHAR(21), tp char(24), cd char(3))

BEGIN
	-- PRODUCTCODETYPE_ID LOOKUP
	DECLARE pctid INT;
        SET pctid = (SELECT ID FROM PRODUCTCODETYPE WHERE `TYPE` = tp);
        IF pctid IS NULL THEN
                INSERT INTO PRODUCTCODETYPE (`TYPE`)
                VALUES (tp);
                SET pctid = @@IDENTITY;
        END IF;
	
	UPDATE IMAGES SET PRODUCTCODE = cd, PRODUCTCODETYPE_ID = pctid
	WHERE IMAGEID = ami_id; 
	
END
%%

DELIMITER ;

