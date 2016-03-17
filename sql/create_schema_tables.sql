DROP TABLE IF EXISTS `IMAGES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `IMAGES` (
  `ID` int(11) NOT NULL auto_increment,
  `ARCHITECTURE` varchar(6) NOT NULL,
  `CREATIONDATE` DATETIME NOT NULL,
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

-- ARCHITECTURE; i386, x86_64
DROP TABLE IF EXISTS `ARCHITECTURE`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ARCHITECTURE` (
  `ID` int(11) NOT NULL auto_increment,
  `TYPE` char(3) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_TYPE` (`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

-- HYPERVISOR; xen, ovm
DROP TABLE IF EXISTS `HYPERVISOR`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `HYPERVISOR` (
  `ID` int(11) NOT NULL auto_increment,
  `TYPE` char(3) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_TYPE` (`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

-- IMAGETYPE; machine, kernel, ramdisk
DROP TABLE IF EXISTS `IMAGETYPE`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `IMAGETYPE` (
  `ID` int(11) NOT NULL auto_increment,
  `TYPE` varchar(8) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_TYPE` (`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

-- ROOTDEVICETYPE; ebs, instance store
DROP TABLE IF EXISTS `ROOTDEVICETYPE`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ROOTDEVICETYPE` (
  `ID` int(11) NOT NULL auto_increment,
  `TYPE` varchar(8) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_TYPE` (`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

-- VIRTUALIZATIONTYPE; paravirtual, hvm
DROP TABLE IF EXISTS `VIRTUALIZATIONTYPE`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `VIRTUALIZATIONTYPE` (
  `ID` int(11) NOT NULL auto_increment,
  `TYPE` varchar(8) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_TYPE` (`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

-- PLATFORM; windows, other linux
DROP TABLE IF EXISTS `PLATFORM`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PLATFORM` (
  `ID` int(11) NOT NULL auto_increment,
  `TYPE` varchar(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_CODE` (`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

-- REGIONCODE; us-east-1, etc
DROP TABLE IF EXISTS `REGIONCODE`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `REGIONCODE` (
  `ID` int(11) NOT NULL auto_increment,
  `CODE` varchar(14) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_CODE` (`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
