drop procedure if exists uspInsertImage;
DELIMITER %%
CREATE PROCEDURE uspInsertImage(arch VARCHAR(6), cd char(24), hv char(3), 
				ii varchar(21), it varchar(7), iname varchar(120), 
				ownid varchar(18), rdt varchar(14), vt varchar(14),  
				pt varchar(7), rg varchar(14))
BEGIN

	DECLARE arch_id INT;
	DECLARE parsed_cd char(19);
	DECLARE hv_id int;
	DECLARE it_id int; 
	DECLARE rdt_id int; 
	DECLARE vt_id int; 
	DECLARE pt_id int; 
	DECLARE rg_id int;

	-- ARCHITECTURE ID LOOKUP
	SET arch_id = (SELECT ID FROM ARCHITECTURE WHERE `TYPE` = arch);
	IF arch_id IS NULL THEN	
        INSERT INTO ARCHITECTURE (`TYPE`)
        VALUES (arch);
        SET arch_id = @@IDENTITY;
    END IF;	

	-- CREATION DATE
	-- Expected Format: 2010-08-16T23:18:19.000Z 
	SET parsed_cd = CONCAT(SUBSTRING(cd, 1, 10), " ", SUBSTRING(cd, 12, 8));

	-- HYPERVISOR ID LOOKUP
	SET hv_id = (SELECT ID FROM HYPERVISOR WHERE `TYPE` = hv);
	IF hv_id IS NULL THEN	
        INSERT INTO HYPERVISOR (`TYPE`)
        VALUES (hv);
        SET hv_id = @@IDENTITY;
    END IF;	

	-- IMAGETYPE ID LOOKUP
	SET it_id = (SELECT ID FROM IMAGETYPE WHERE `TYPE` = it);
	IF it_id IS NULL THEN	
        INSERT INTO IMAGETYPE (`TYPE`)
        VALUES (it);
        SET it_id = @@IDENTITY;
    END IF;	

	-- ROOTDEVICETYPE ID LOOKUP
	SET rdt_id = (SELECT ID FROM ROOTDEVICETYPE WHERE `TYPE` = rdt);
	IF rdt_id IS NULL THEN	
        INSERT INTO ROOTDEVICETYPE (`TYPE`)
        VALUES (rdt);
        SET rdt_id = @@IDENTITY;
    END IF;    

	-- VIRTUALIZATIONTYPE ID LOOKUP
	SET vt_id = (SELECT ID FROM VIRTUALIZATIONTYPE WHERE `TYPE` = vt);
	IF vt_id IS NULL THEN	
        INSERT INTO VIRTUALIZATIONTYPE (`TYPE`)
        VALUES (vt);
        SET vt_id = @@IDENTITY;
    END IF;    

	-- PLATFORM ID LOOKUP
	SET pt_id = (SELECT ID FROM PLATFORM WHERE `TYPE` = pt);
	IF pt_id IS NULL THEN	
        INSERT INTO PLATFORM (`TYPE`)
        VALUES (pt);
     	SET pt_id = @@IDENTITY;
    END IF;

	-- REGIONNAME ID LOOKUP
	SET rg_id = (SELECT ID FROM REGIONNAME WHERE `NAME` = rg);
	IF rg_id IS NULL THEN	
        INSERT INTO REGIONNAME (`NAME`)
        VALUES (rg);
     	SET rg_id = @@IDENTITY;
    END IF;

	INSERT INTO IMAGES (ARCHITECTURE_ID,CREATIONDATE,HYPERVISOR_ID,IMAGEID,IMAGETYPE_ID,NAME,OWNERID,ROOTDEVICETYPE_ID,VIRTUALIZATIONTYPE_ID,PLATFORM_ID,REGIONCODE_ID)
	VALUES (arch_id, parsed_cd, hv_id, ii, it_id, iname, ownid, rdt_id, vt_id, pt_id, rg_id);

END
%%

DELIMITER ;

drop procedure if exists uspUpdateImageProductCode;
DELIMITER %%
CREATE PROCEDURE uspUpdateImageProductCode(ami_id VARCHAR(21), tp varchar(11), cd char(30))

BEGIN
	-- PRODUCTCODETYPE_ID LOOKUP
	DECLARE pct_id INT;
        SET pct_id = (SELECT ID FROM PRODUCTCODETYPE WHERE `TYPE` = tp);
        IF pct_id IS NULL THEN
	        INSERT INTO PRODUCTCODETYPE (`TYPE`)
	        VALUES (tp);
	        SET pct_id = @@IDENTITY;
        END IF;
	
	UPDATE IMAGES SET PRODUCTCODE = cd, PRODUCTCODETYPE_ID = pct_id
	WHERE IMAGEID = ami_id; 
	
END
%%

DELIMITER ;

