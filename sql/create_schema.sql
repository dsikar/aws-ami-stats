DROP TABLE IF EXISTS `IMAGES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `IMAGES` (
  `ID` int(11) NOT NULL auto_increment,
  `ARCHITECTURE` varchar(6) NOT NULL,
  `CREATIONDATE` char(24) NOT NULL,
  `HYPERVISOR` char(3) NOT NULL,
  `IMAGEID` varchar(21) NOT NULL,
  `IMAGETYPE` varchar(7) NOT NULL,
  `NAME` varchar(120) NOT NULL,
  `OWNERID` varchar(18) NOT NULL,
  `ROOTDEVICETYPE` varchar(14) NOT NULL,
  `VIRTUALIZATIONTYPE` varchar(11) NOT NULL,
  `PRODUCTCODE` varchar(50) NOT NULL,
  `REGIONCODE` varchar(14) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_IMAGEID_REGIONCODE` (`IMAGEID`,`REGIONCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

drop procedure if exists uspInsertImage;
DELIMITER %%
CREATE PROCEDURE uspInsertImage(arch VARCHAR(6), cd char(24), hv char(3), 
				ii varchar(21), it varchar(7), iname varchar(120), 
				ownid varchar(18), rdt varchar(14), vt varchar(11),  
				pc varchar(50), rg varchar(14))
BEGIN

	INSERT INTO IMAGES (ARCHITECTURE,CREATIONDATE,HYPERVISOR,IMAGEID,IMAGETYPE,NAME,OWNERID,ROOTDEVICETYPE,VIRTUALIZATIONTYPE,PRODUCTCODE,REGIONCODE)
	VALUES (arch, cd, hv, ii, it, iname, ownid, rdt, vt, pc, rg);

END
%%

DELIMITER ;

