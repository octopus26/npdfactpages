-- Begin

SET NAMES 'utf8';
ALTER DATABASE npdfactpages 
    DEFAULT CHARACTER SET utf8 
    DEFAULT COLLATE utf8_general_ci;

-- Pre

SET FOREIGN_KEY_CHECKS = 0;

-- Tables

DROP TABLE IF EXISTS discovery_reserves;
DROP TABLE IF EXISTS wellbore_core;
DROP TABLE IF EXISTS field_investment_yearly;
DROP TABLE IF EXISTS field_production_totalt_NCS_year;
DROP TABLE IF EXISTS company_reserves;
DROP TABLE IF EXISTS wellbore_formation_top;
DROP TABLE IF EXISTS strat_litho_wellbore;
DROP TABLE IF EXISTS tuf_owner_hst;
DROP TABLE IF EXISTS apaAreaGross;
DROP TABLE IF EXISTS fldArea;
DROP TABLE IF EXISTS field_owner_hst;
DROP TABLE IF EXISTS wlbPoint;
DROP TABLE IF EXISTS prlAreaSplitByBlock;
DROP TABLE IF EXISTS tuf_petreg_licence_licencee;
DROP TABLE IF EXISTS discovery;
DROP TABLE IF EXISTS bsns_arr_area_licensee_hst;
DROP TABLE IF EXISTS wellbore_dst;
DROP TABLE IF EXISTS wellbore_npdid_overview;
DROP TABLE IF EXISTS wellbore_oil_sample;
DROP TABLE IF EXISTS licence;
DROP TABLE IF EXISTS seaArea;
DROP TABLE IF EXISTS wellbore_development_all;
DROP TABLE IF EXISTS licence_petreg_message;
DROP TABLE IF EXISTS fclPoint;
DROP TABLE IF EXISTS field_operator_hst;
DROP TABLE IF EXISTS licence_petreg_licence_licencee;
DROP TABLE IF EXISTS seis_acquisition_coordinates_inc_turnarea;
DROP TABLE IF EXISTS field_production_yearly;
DROP TABLE IF EXISTS pipLine;
DROP TABLE IF EXISTS dscArea;
DROP TABLE IF EXISTS licence_task;
DROP TABLE IF EXISTS licence_oper_hst;
DROP TABLE IF EXISTS licence_phase_hst;
DROP TABLE IF EXISTS wellbore_core_photo;
DROP TABLE IF EXISTS baaArea;
DROP TABLE IF EXISTS bsns_arr_area_area_poly_hst;
DROP TABLE IF EXISTS field_activity_status_hst;
DROP TABLE IF EXISTS bsns_arr_area;
DROP TABLE IF EXISTS bsns_arr_area_operator;
DROP TABLE IF EXISTS tuf_petreg_message;
DROP TABLE IF EXISTS wellbore_casing_and_lot;
DROP TABLE IF EXISTS field;
DROP TABLE IF EXISTS strat_litho_wellbore_core;
DROP TABLE IF EXISTS seis_acquisition;
DROP TABLE IF EXISTS tuf_petreg_licence;
DROP TABLE IF EXISTS licence_area_poly_hst;
DROP TABLE IF EXISTS seaMultiline;
DROP TABLE IF EXISTS licence_petreg_licence_oper;
DROP TABLE IF EXISTS prlArea;
DROP TABLE IF EXISTS seis_acquisition_progress;
DROP TABLE IF EXISTS tuf_petreg_licence_oper;
DROP TABLE IF EXISTS wellbore_shallow_all;
DROP TABLE IF EXISTS licence_licensee_hst;
DROP TABLE IF EXISTS field_description;
DROP TABLE IF EXISTS facility_fixed;
DROP TABLE IF EXISTS field_production_monthly;
DROP TABLE IF EXISTS bsns_arr_area_transfer_hst;
DROP TABLE IF EXISTS field_production_totalt_NCS_month;
DROP TABLE IF EXISTS facility_moveable;
DROP TABLE IF EXISTS licence_transfer_hst;
DROP TABLE IF EXISTS wellbore_document;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS apaAreaNet;
DROP TABLE IF EXISTS field_reserves;
DROP TABLE IF EXISTS wellbore_exploration_all;
DROP TABLE IF EXISTS field_licensee_hst;
DROP TABLE IF EXISTS licence_petreg_licence;
DROP TABLE IF EXISTS wellbore_mud;
DROP TABLE IF EXISTS tuf_operator_hst;
DROP TABLE IF EXISTS wellbore_coordinates;

CREATE TABLE discovery_reserves (
	dscName VARCHAR(40) NOT NULL COMMENT "Discovery name",
	dscReservesRC VARCHAR(40) NOT NULL COMMENT "Resource class",
	dscRecoverableOil DECIMAL(13,6) NOT NULL COMMENT "Rec. oil [mill Sm3]",
	dscRecoverableGas DECIMAL(13,6) NOT NULL COMMENT "Rec. gas [bill Sm3]",
	dscRecoverableNGL DECIMAL(13,6) NOT NULL COMMENT "Rec. NGL [mill tonn]",
	dscRecoverableCondensate DECIMAL(13,6) NOT NULL COMMENT "Rec. cond. [mill Sm3]",
	dscDateOffResEstDisplay DATE NOT NULL COMMENT "Resource updated date",
	dscNpdidDiscovery INTEGER NOT NULL COMMENT "NPDID discovery",
	dscReservesDateUpdated DATE NOT NULL,
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (dscNpdidDiscovery,dscReservesRC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'discovery_reserves' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/discovery_reserves.csv"
INTO TABLE discovery_reserves
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `dscName` = @var1,
    `dscReservesRC` = @var2,
    `dscRecoverableOil` = @var3,
    `dscRecoverableGas` = @var4,
    `dscRecoverableNGL` = @var5,
    `dscRecoverableCondensate` = @var6,
    `dscDateOffResEstDisplay` = @var7,
    `dscNpdidDiscovery` = @var8,
    `dscReservesDateUpdated` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE wellbore_core (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	wlbCoreNumber INTEGER NOT NULL COMMENT "Core sample number",
	wlbCoreIntervalTop DECIMAL(13,6) COMMENT "Core sample - top depth",
	wlbCoreIntervalBottom DECIMAL(13,6) COMMENT "Core sample - bottom depth",
	wlbCoreIntervalUom VARCHAR(6) COMMENT "Core sample depth - uom",
	wlbTotalCoreLength DECIMAL(13,6) NOT NULL COMMENT "Total core sample length [m]",
	wlbNumberOfCores INTEGER NOT NULL COMMENT "Number of cores samples",
	wlbCoreSampleAvailable VARCHAR(3) NOT NULL COMMENT "Core samples available",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbCoreDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	wellbore_core_id SERIAL,
	PRIMARY KEY (wellbore_core_id,wlbNpdidWellbore,wlbCoreNumber)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_core' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_core.csv"
INTO TABLE wellbore_core
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `wlbName` = @var1,
    `wlbCoreNumber` = @var2,
    `wlbCoreIntervalTop` = @var3,
    `wlbCoreIntervalBottom` = @var4,
    `wlbCoreIntervalUom` = @var5,
    `wlbTotalCoreLength` = @var6,
    `wlbNumberOfCores` = @var7,
    `wlbCoreSampleAvailable` = @var8,
    `wlbNpdidWellbore` = @var9,
    `wlbCoreDateUpdated` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;


CREATE TABLE field_investment_yearly (
	prfInformationCarrier VARCHAR(40) NOT NULL COMMENT "Field (Discovery)",
	prfYear INTEGER NOT NULL COMMENT "Year",
	prfInvestmentsMillNOK DECIMAL(13,6) NOT NULL COMMENT "Investments [mill NOK norminal values]",
	prfNpdidInformationCarrier INTEGER NOT NULL COMMENT "NPDID information carrier",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prfNpdidInformationCarrier,prfYear)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_investment_yearly' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_investment_yearly.csv"
INTO TABLE field_investment_yearly
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5)
SET `prfInformationCarrier` = @var1,
    `prfYear` = @var2,
    `prfInvestmentsMillNOK` = @var3,
    `prfNpdidInformationCarrier` = @var4,
    `dateSyncNPD` = @var5;
SHOW WARNINGS;


CREATE TABLE field_production_totalt_NCS_year (
	prfYear INTEGER NOT NULL COMMENT "Year",
	prfPrdOilNetMillSm DECIMAL(13,6) NOT NULL,
	prfPrdGasNetBillSm DECIMAL(13,6) NOT NULL,
	prfPrdCondensateNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - condensate [mill Sm3]",
	prfPrdNGLNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - NGL [mill Sm3]",
	prfPrdOeNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - oil equivalents [mill Sm3]",
	prfPrdProducedWaterInFieldMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Produced water in field [mill Sm3]",
	PRIMARY KEY (prfYear)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_production_totalt_NCS_year' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_production_totalt_NCS_year.csv"
INTO TABLE field_production_totalt_NCS_year
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7)
SET `prfYear` = @var1,
    `prfPrdOilNetMillSm` = @var2,
    `prfPrdGasNetBillSm` = @var3,
    `prfPrdCondensateNetMillSm3` = @var4,
    `prfPrdNGLNetMillSm3` = @var5,
    `prfPrdOeNetMillSm3` = @var6,
    `prfPrdProducedWaterInFieldMillSm3` = @var7;
SHOW WARNINGS;


CREATE TABLE company_reserves (
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	cmpRecoverableOil DECIMAL(13,6) NOT NULL,
	cmpRecoverableGas DECIMAL(13,6) NOT NULL,
	cmpRecoverableNGL DECIMAL(13,6) NOT NULL,
	cmpRecoverableCondensate DECIMAL(13,6) NOT NULL,
	cmpRecoverableOE DECIMAL(13,6) NOT NULL,
	cmpRemainingOil DECIMAL(13,6) NOT NULL,
	cmpRemainingGas DECIMAL(13,6) NOT NULL,
	cmpRemainingNGL DECIMAL(13,6) NOT NULL,
	cmpRemainingCondensate DECIMAL(13,6) NOT NULL,
	cmpRemainingOE DECIMAL(13,6) NOT NULL,
	cmpDateOffResEstDisplay DATE NOT NULL,
	cmpShare DECIMAL(13,6) NOT NULL,
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (cmpNpdidCompany,fldNpdidField)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'company_reserves' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/company_reserves.csv"
INTO TABLE company_reserves
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17)
SET `cmpLongName` = @var1,
    `fldName` = @var2,
    `cmpRecoverableOil` = @var3,
    `cmpRecoverableGas` = @var4,
    `cmpRecoverableNGL` = @var5,
    `cmpRecoverableCondensate` = @var6,
    `cmpRecoverableOE` = @var7,
    `cmpRemainingOil` = @var8,
    `cmpRemainingGas` = @var9,
    `cmpRemainingNGL` = @var10,
    `cmpRemainingCondensate` = @var11,
    `cmpRemainingOE` = @var12,
    `cmpDateOffResEstDisplay` = @var13,
    `cmpShare` = @var14,
    `fldNpdidField` = @var15,
    `cmpNpdidCompany` = @var16,
    `dateSyncNPD` = @var17;
SHOW WARNINGS;


CREATE TABLE wellbore_formation_top (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	lsuTopDepth DECIMAL(13,6) NOT NULL COMMENT "Top depth [m]",
	lsuBottomDepth DECIMAL(13,6) NOT NULL COMMENT "Bottom depth [m]",
	lsuName VARCHAR(20) NOT NULL COMMENT "Lithostrat. unit",
	lsuLevel VARCHAR(9) NOT NULL COMMENT "Level",
	lsuNameParent VARCHAR(20) COMMENT "Lithostrat. unit, parent",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	lsuNpdidLithoStrat INTEGER NOT NULL COMMENT "NPDID lithostrat. unit",
	lsuNpdidLithoStratParent INTEGER COMMENT "NPDID parent lithostrat. unit",
	lsuWellboreUpdatedDate DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore,lsuNpdidLithoStrat,lsuTopDepth,lsuBottomDepth)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_formation_top' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_formation_top.csv"
INTO TABLE wellbore_formation_top
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `wlbName` = @var1,
    `lsuTopDepth` = @var2,
    `lsuBottomDepth` = @var3,
    `lsuName` = @var4,
    `lsuLevel` = @var5,
    `lsuNameParent` = @var6,
    `wlbNpdidWellbore` = @var7,
    `lsuNpdidLithoStrat` = @var8,
    `lsuNpdidLithoStratParent` = @var9,
    `lsuWellboreUpdatedDate` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;


CREATE TABLE strat_litho_wellbore (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	lsuTopDepth DECIMAL(13,6) NOT NULL COMMENT "Top depth [m]",
	lsuBottomDepth DECIMAL(13,6) NOT NULL COMMENT "Bottom depth [m]",
	lsuName VARCHAR(20) NOT NULL COMMENT "Lithostrat. unit",
	lsuLevel VARCHAR(9) NOT NULL COMMENT "Level",
	lsuNpdidLithoStrat INTEGER NOT NULL COMMENT "NPDID lithostrat. unit",
	wlbCompletionDate DATE NOT NULL COMMENT "Completion date",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	lsuWellboreUpdatedDate DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore,lsuNpdidLithoStrat,lsuTopDepth,lsuBottomDepth)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'strat_litho_wellbore' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/strat_litho_wellbore.csv"
INTO TABLE strat_litho_wellbore
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `wlbName` = @var1,
    `lsuTopDepth` = @var2,
    `lsuBottomDepth` = @var3,
    `lsuName` = @var4,
    `lsuLevel` = @var5,
    `lsuNpdidLithoStrat` = @var6,
    `wlbCompletionDate` = @var7,
    `wlbNpdidWellbore` = @var8,
    `lsuWellboreUpdatedDate` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE tuf_owner_hst (
	tufName VARCHAR(40) NOT NULL COMMENT "TUF",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	tufOwnerDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	tufOwnerDateValidTo DATE COMMENT "Date valid to",
	tufOwnerShare DECIMAL(13,6) NOT NULL COMMENT "Share [%]",
	tufNpdidTuf INTEGER NOT NULL COMMENT "NPDID tuf",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (tufNpdidTuf,cmpNpdidCompany,tufOwnerDateValidFrom,tufOwnerDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'tuf_owner_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/tuf_owner_hst.csv"
INTO TABLE tuf_owner_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `tufName` = @var1,
    `cmpLongName` = @var2,
    `tufOwnerDateValidFrom` = @var3,
    `tufOwnerDateValidTo` = @var4,
    `tufOwnerShare` = @var5,
    `tufNpdidTuf` = @var6,
    `cmpNpdidCompany` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE apaAreaGross (
	apaMap_no INTEGER NOT NULL,
	apaAreaGeometryEWKT MULTIPOLYGON DEFAULT NULL,
	apaAreaGeometry_KML_WGS84 TEXT NOT NULL,
	apaAreaGross_id SERIAL,
	PRIMARY KEY (apaAreaGross_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'apaAreaGross' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/apaAreaGross.csv"
INTO TABLE apaAreaGross
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3)
SET `apaMap_no` = @var1,
    `apaAreaGeometryEWKT` = ST_GeomFromText(@var2),
    `apaAreaGeometry_KML_WGS84` = @var3;
SHOW WARNINGS;

/*
CREATE TABLE fldArea (
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	dscNpdidDiscovery INTEGER NOT NULL COMMENT "NPDID discovery",
	dscName VARCHAR(40) NOT NULL COMMENT "Discovery name",
	dscResInclInDiscoveryName VARCHAR(40) COMMENT "Resources incl. in",
	dscNpdidResInclInDiscovery INTEGER,
	dscIncludedInFld VARCHAR(3) NOT NULL,
	dscHcType VARCHAR(40) NOT NULL COMMENT "HC type",
	fldHcType VARCHAR(40) NOT NULL,
	dscCurrentActivityStatus VARCHAR(40) NOT NULL COMMENT "Current activity status",
	fldCurrentActivityStatus VARCHAR(40) NOT NULL,
	flddscLabel VARCHAR(40) NOT NULL,
	dscFactUrl VARCHAR(200) NOT NULL,
	fldFactUrl VARCHAR(200) NOT NULL,
	flddscAreaGeometryWKT_ED50 MULTIPOLYGON DEFAULT NULL,
	PRIMARY KEY (dscNpdidDiscovery,dscHcType)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'fldArea' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/fldArea.csv"
INTO TABLE fldArea
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
# IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15)
SET `fldNpdidField` = @var1,
    `fldName` = @var2,
    `dscNpdidDiscovery` = @var3,
    `dscName` = @var4,
    `dscResInclInDiscoveryName` = @var5,
    `dscNpdidResInclInDiscovery` = @var6,
    `dscIncludedInFld` = @var7,
    `dscHcType` = @var8,
    `fldHcType` = @var9,
    `dscCurrentActivityStatus` = @var10,
    `fldCurrentActivityStatus` = @var11,
    `flddscLabel` = @var12,
    `dscFactUrl` = @var13,
    `fldFactUrl` = @var14,
   `flddscAreaGeometryWKT_ED50` = ST_GeomFromText(@var15);
SHOW WARNINGS;
*/

CREATE TABLE field_owner_hst (
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	fldOwnerKind VARCHAR(40) NOT NULL COMMENT "Owner kind",
	fldOwnerName VARCHAR(40) NOT NULL COMMENT "Owner name",
	fldOwnershipFromDate DATE NOT NULL,
	fldOwnershipToDate DATE,
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	fldNpdidOwner INTEGER NOT NULL COMMENT "NPDID owner",
	fldOwnerDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fldNpdidField,fldNpdidOwner,fldOwnershipFromDate,fldOwnershipToDate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_owner_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_owner_hst.csv"
INTO TABLE field_owner_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9)
SET `fldName` = @var1,
    `fldOwnerKind` = @var2,
    `fldOwnerName` = @var3,
    `fldOwnershipFromDate` = @var4,
    `fldOwnershipToDate` = @var5,
    `fldNpdidField` = @var6,
    `fldNpdidOwner` = @var7,
    `fldOwnerDateUpdated` = @var8,
    `dateSyncNPD` = @var9;
SHOW WARNINGS;


CREATE TABLE wlbPoint (
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbWellName VARCHAR(40) NOT NULL,
	wlbWellboreName VARCHAR(40) NOT NULL COMMENT "Wellbore name",
	wlbField VARCHAR(40) COMMENT "Field",
	wlbProductionLicence VARCHAR(40) COMMENT "Drilled in production licence",
	wlbWellType VARCHAR(20) COMMENT "Type",
	wlbDrillingOperator VARCHAR(60) NOT NULL COMMENT "Drilling operator",
	wlbMultilateral VARCHAR(3) NOT NULL COMMENT "Multilateral",
	wlbDrillingFacility VARCHAR(50) COMMENT "Drilling facility",
	wlbProductionFacility VARCHAR(50) COMMENT "Production facility",
	wlbEntryDate DATE COMMENT "Entry date",
	wlbCompletionDate DATE COMMENT "Completion date",
	wlbContent VARCHAR(40) COMMENT "Content",
	wlbStatus VARCHAR(40) COMMENT "Status",
	wlbSymbol INTEGER NOT NULL,
	wlbPurpose VARCHAR(40) COMMENT "Purpose",
	wlbWaterDepth DECIMAL(13,6) NOT NULL COMMENT "Water depth [m]",
	wlbFactPageUrl VARCHAR(200) COMMENT "FactPage url",
	wlbFactMapUrl VARCHAR(200) COMMENT "FactMap url",
	wlbDiscoveryWellbore VARCHAR(3) NOT NULL COMMENT "Discovery wellbore",
	wlbPointGeometryWKT POINT DEFAULT NULL,
	PRIMARY KEY (wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wlbPoint' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wlbPoint.csv"
INTO TABLE wlbPoint
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21)
SET `wlbNpdidWellbore` = @var1,
    `wlbWellName` = @var2,
    `wlbWellboreName` = @var3,
    `wlbField` = @var4,
    `wlbProductionLicence` = @var5,
    `wlbWellType` = @var6,
    `wlbDrillingOperator` = @var7,
    `wlbMultilateral` = @var8,
    `wlbDrillingFacility` = @var9,
    `wlbProductionFacility` = @var10,
    `wlbEntryDate` = @var11,
    `wlbCompletionDate` = @var12,
    `wlbContent` = @var13,
    `wlbStatus` = @var14,
    `wlbSymbol` = @var15,
    `wlbPurpose` = @var16,
    `wlbWaterDepth` = @var17,
    `wlbFactPageUrl` = @var18,
    `wlbFactMapUrl` = @var19,
    `wlbDiscoveryWellbore` = @var20,
    `wlbPointGeometryWKT` = ST_GeomFromText(@var21);
SHOW WARNINGS;


CREATE TABLE prlAreaSplitByBlock (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlActive VARCHAR(20) NOT NULL COMMENT "Active",
	prlCurrentArea VARCHAR(20) NOT NULL COMMENT "Current area",
	prlDateGranted DATE NOT NULL COMMENT "Date granted",
	prlDateValidTo DATE NOT NULL COMMENT "Date valid to",
	prlAreaPolyDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	prlAreaPolyDateValidTo DATE COMMENT "Date valid to",
	prlAreaPolyPolyNo INTEGER NOT NULL,
	prlAreaPolyPolyArea DECIMAL(13,6) NOT NULL COMMENT "Polygon area [km2]",
	blcName VARCHAR(40) NOT NULL COMMENT "Block name",
	prlAreaPolyFromZvalue INTEGER NOT NULL,
	prlAreaPolyToZvalue INTEGER NOT NULL,
	prlAreaPolyVertLimEn TEXT,
	prlAreaPolyVertLimNo TEXT,
	prlStratigraphical VARCHAR(3) NOT NULL,
	prlLastOperatorNpdidCompany INTEGER NOT NULL,
	prlLastOperatorNameShort VARCHAR(40) NOT NULL,
	prlLastOperatorNameLong VARCHAR(200) NOT NULL,
	prlLicensingActivityName VARCHAR(40) NOT NULL COMMENT "Licensing activity",
	prlFactUrl VARCHAR(200) NOT NULL,
	prlAreaPolyStratigraphical VARCHAR(4) NOT NULL COMMENT "Stratigraphcal",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	prlAreaGeometryWKT MULTIPOLYGON DEFAULT NULL,
	PRIMARY KEY (prlNpdidLicence,blcName,prlAreaPolyPolyNo,prlAreaPolyDateValidFrom,prlAreaPolyDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'prlAreaSplitByBlock' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/prlAreaSplitByBlock.csv"
INTO TABLE prlAreaSplitByBlock
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23)
SET `prlName` = @var1,
    `prlActive` = @var2,
    `prlCurrentArea` = @var3,
    `prlDateGranted` = @var4,
    `prlDateValidTo` = @var5,
    `prlAreaPolyDateValidFrom` = @var6,
    `prlAreaPolyDateValidTo` = @var7,
    `prlAreaPolyPolyNo` = @var8,
    `prlAreaPolyPolyArea` = @var9,
    `blcName` = @var10,
    `prlAreaPolyFromZvalue` = @var11,
    `prlAreaPolyToZvalue` = @var12,
    `prlAreaPolyVertLimEn` = @var13,
    `prlAreaPolyVertLimNo` = @var14,
    `prlStratigraphical` = @var15,
    `prlLastOperatorNpdidCompany` = @var16,
    `prlLastOperatorNameShort` = @var17,
    `prlLastOperatorNameLong` = @var18,
    `prlLicensingActivityName` = @var19,
    `prlFactUrl` = @var20,
    `prlAreaPolyStratigraphical` = @var21,
    `prlNpdidLicence` = @var22,
    `prlAreaGeometryWKT` = ST_GeomFromText(@var23);
SHOW WARNINGS;


CREATE TABLE tuf_petreg_licence_licencee (
	ptlName VARCHAR(40) NOT NULL COMMENT "Tillatelse",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	ptlLicenseeInterest DECIMAL(13,6) NOT NULL COMMENT "Andel [%]",
	tufName VARCHAR(40) NOT NULL COMMENT "TUF",
	tufNpdidTuf INTEGER NOT NULL COMMENT "NPDID tuf",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	ptlLicenseeDateUpdated DATE COMMENT "Dato oppdatert",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (tufNpdidTuf,cmpNpdidCompany)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'tuf_petreg_licence_licencee' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/tuf_petreg_licence_licencee.csv"
INTO TABLE tuf_petreg_licence_licencee
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `ptlName` = @var1,
    `cmpLongName` = @var2,
    `ptlLicenseeInterest` = @var3,
    `tufName` = @var4,
    `tufNpdidTuf` = @var5,
    `cmpNpdidCompany` = @var6,
    `ptlLicenseeDateUpdated` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE discovery (
	dscName VARCHAR(40) NOT NULL COMMENT "Discovery name",
	cmpLongName VARCHAR(200) COMMENT "Company name",
	dscCurrentActivityStatus VARCHAR(40) NOT NULL COMMENT "Current activity status",
	dscHcType VARCHAR(40) COMMENT "HC type",
	wlbName VARCHAR(60) COMMENT "Wellbore name",
	nmaName VARCHAR(40) COMMENT "Main NCS area",
	fldName VARCHAR(40) COMMENT "Field name",
	dscDateFromInclInField DATE COMMENT "Included in field from date",
	dscDiscoveryYear INTEGER NOT NULL COMMENT "Discovery year",
	dscResInclInDiscoveryName VARCHAR(40) COMMENT "Resources incl. in",
	dscOwnerKind VARCHAR(40) COMMENT "Owner kind",
	dscOwnerName VARCHAR(40) COMMENT "Owner name",
	dscNpdidDiscovery INTEGER NOT NULL COMMENT "NPDID discovery",
	fldNpdidField INTEGER COMMENT "NPDID field",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	dscFactPageUrl VARCHAR(200) NOT NULL COMMENT "Fact page",
	dscFactMapUrl VARCHAR(200) NOT NULL COMMENT "Fact map",
	dscDateUpdated DATE COMMENT "Date main level updated",
	dscDateUpdatedMax DATE COMMENT "Date all updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (dscNpdidDiscovery)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'discovery' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/discovery.csv"
INTO TABLE discovery
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20)
SET `dscName` = @var1,
    `cmpLongName` = @var2,
    `dscCurrentActivityStatus` = @var3,
    `dscHcType` = @var4,
    `wlbName` = @var5,
    `nmaName` = @var6,
    `fldName` = @var7,
    `dscDateFromInclInField` = @var8,
    `dscDiscoveryYear` = @var9,
    `dscResInclInDiscoveryName` = @var10,
    `dscOwnerKind` = @var11,
    `dscOwnerName` = @var12,
    `dscNpdidDiscovery` = @var13,
    `fldNpdidField` = @var14,
    `wlbNpdidWellbore` = @var15,
    `dscFactPageUrl` = @var16,
    `dscFactMapUrl` = @var17,
    `dscDateUpdated` = @var18,
    `dscDateUpdatedMax` = @var19,
    `dateSyncNPD` = @var20;
SHOW WARNINGS;


CREATE TABLE bsns_arr_area_licensee_hst (
	baaName VARCHAR(40) NOT NULL COMMENT "Name",
	baaLicenseeDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	baaLicenseeDateValidTo DATE COMMENT "Date valid to",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	baaLicenseeInterest DECIMAL(13,6) NOT NULL COMMENT "Interest [%]",
	baaLicenseeSdfi DECIMAL(13,6) COMMENT "SDFI [%]",
	baaNpdidBsnsArrArea INTEGER NOT NULL COMMENT "NPDID Bsns. Arr. Area",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	baaLicenseeDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (baaNpdidBsnsArrArea,cmpNpdidCompany,baaLicenseeDateValidFrom,baaLicenseeDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'bsns_arr_area_licensee_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/bsns_arr_area_licensee_hst.csv"
INTO TABLE bsns_arr_area_licensee_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `baaName` = @var1,
    `baaLicenseeDateValidFrom` = @var2,
    `baaLicenseeDateValidTo` = @var3,
    `cmpLongName` = @var4,
    `baaLicenseeInterest` = @var5,
    `baaLicenseeSdfi` = @var6,
    `baaNpdidBsnsArrArea` = @var7,
    `cmpNpdidCompany` = @var8,
    `baaLicenseeDateUpdated` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE wellbore_dst (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	wlbDstTestNumber DECIMAL(13,6) NOT NULL COMMENT "Test number",
	wlbDstFromDepth DECIMAL(13,6) NOT NULL COMMENT "From depth MD [m]",
	wlbDstToDepth DECIMAL(13,6) NOT NULL COMMENT "To depth MD [m]",
	wlbDstChokeSize DECIMAL(13,6) NOT NULL COMMENT "Choke size [mm]",
	wlbDstFinShutInPress DECIMAL(13,6) NOT NULL COMMENT "Final shut-in pressure [MPa]",
	wlbDstFinFlowPress DECIMAL(13,6) NOT NULL COMMENT "Final flow pressure [MPa]",
	wlbDstBottomHolePress DECIMAL(13,6) NOT NULL COMMENT "Bottom hole pressure [MPa]",
	wlbDstOilProd INTEGER NOT NULL COMMENT "Oil [Sm3/day]",
	wlbDstGasProd INTEGER NOT NULL COMMENT "Gas [Sm3/day]",
	wlbDstOilDensity DECIMAL(13,6) NOT NULL COMMENT "Oil density [g/cm3]",
	wlbDstGasDensity DECIMAL(13,6) NOT NULL COMMENT "Gas grav. rel.air",
	wlbDstGasOilRelation INTEGER NOT NULL COMMENT "GOR [m3/m3]",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbDstDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore,wlbDstTestNumber)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_dst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_dst.csv"
INTO TABLE wellbore_dst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16)
SET `wlbName` = @var1,
    `wlbDstTestNumber` = @var2,
    `wlbDstFromDepth` = @var3,
    `wlbDstToDepth` = @var4,
    `wlbDstChokeSize` = @var5,
    `wlbDstFinShutInPress` = @var6,
    `wlbDstFinFlowPress` = @var7,
    `wlbDstBottomHolePress` = @var8,
    `wlbDstOilProd` = @var9,
    `wlbDstGasProd` = @var10,
    `wlbDstOilDensity` = @var11,
    `wlbDstGasDensity` = @var12,
    `wlbDstGasOilRelation` = @var13,
    `wlbNpdidWellbore` = @var14,
    `wlbDstDateUpdated` = @var15,
    `dateSyncNPD` = @var16;
SHOW WARNINGS;


CREATE TABLE wellbore_npdid_overview (
	wlbWellboreName VARCHAR(40) NOT NULL COMMENT "Wellbore name",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbWell VARCHAR(40) NOT NULL COMMENT "Well name",
	wlbWellType VARCHAR(20) COMMENT "Type",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_npdid_overview' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_npdid_overview.csv"
INTO TABLE wellbore_npdid_overview
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5)
SET `wlbWellboreName` = @var1,
    `wlbNpdidWellbore` = @var2,
    `wlbWell` = @var3,
    `wlbWellType` = @var4,
    `dateSyncNPD` = @var5;
SHOW WARNINGS;


CREATE TABLE wellbore_oil_sample (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	wlbOilSampleTestType VARCHAR(4) COMMENT "Test type",
	wlbOilSampleTestNumber VARCHAR(10) COMMENT "Bottle test number",
	wlbOilSampleTopDepth DECIMAL(13,6) NOT NULL COMMENT "Top depth MD [m]",
	wlbOilSampleBottomDepth DECIMAL(13,6) NOT NULL COMMENT "Bottom depth MD [m]",
	wlbOilSampleFluidType VARCHAR(20) COMMENT "Fluid type",
	wlbOilSampleTestDate DATE COMMENT "Test date and time of day",
	wlbOilSampledateReceivedDate DATE COMMENT "Received date",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbOilSampleDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	wellbore_oil_sample_id SERIAL,
	PRIMARY KEY (wellbore_oil_sample_id,wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_oil_sample' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_oil_sample.csv"
INTO TABLE wellbore_oil_sample
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `wlbName` = @var1,
    `wlbOilSampleTestType` = @var2,
    `wlbOilSampleTestNumber` = @var3,
    `wlbOilSampleTopDepth` = @var4,
    `wlbOilSampleBottomDepth` = @var5,
    `wlbOilSampleFluidType` = @var6,
    `wlbOilSampleTestDate` = @var7,
    `wlbOilSampledateReceivedDate` = @var8,
    `wlbNpdidWellbore` = @var9,
    `wlbOilSampleDateUpdated` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;


CREATE TABLE licence (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlLicensingActivityName VARCHAR(40) NOT NULL COMMENT "Licensing activity",
	prlMainArea VARCHAR(40) COMMENT "Main area",
	prlStatus VARCHAR(40) NOT NULL COMMENT "Status",
	prlDateGranted DATE NOT NULL COMMENT "Date granted",
	prlDateValidTo DATE NOT NULL COMMENT "Date valid to",
	prlOriginalArea DECIMAL(13,6) NOT NULL COMMENT "Original area [km2]",
	prlCurrentArea VARCHAR(20) NOT NULL COMMENT "Current area",
	prlPhaseCurrent VARCHAR(40) COMMENT "Phase - current",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	prlFactPageUrl VARCHAR(200) NOT NULL COMMENT "Fact page",
	prlFactMapUrl VARCHAR(200) COMMENT "Fact map",
	prlDateUpdated DATE COMMENT "Date main level updated",
	prlDateUpdatedMax DATE COMMENT "Date all updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence.csv"
INTO TABLE licence
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15)
SET `prlName` = @var1,
    `prlLicensingActivityName` = @var2,
    `prlMainArea` = @var3,
    `prlStatus` = @var4,
    `prlDateGranted` = @var5,
    `prlDateValidTo` = @var6,
    `prlOriginalArea` = @var7,
    `prlCurrentArea` = @var8,
    `prlPhaseCurrent` = @var9,
    `prlNpdidLicence` = @var10,
    `prlFactPageUrl` = @var11,
    `prlFactMapUrl` = @var12,
    `prlDateUpdated` = @var13,
    `prlDateUpdatedMax` = @var14,
    `dateSyncNPD` = @var15;
SHOW WARNINGS;


CREATE TABLE seaArea (
	seaSurveyName VARCHAR(100) NOT NULL COMMENT "Survey name",
	seaNpdidSurvey INTEGER NOT NULL COMMENT "NPDID for survey",
	seaFactMapUrl VARCHAR(260) COMMENT "Fact Map",
	seaFactPageUrl VARCHAR(200),
	seaStatus VARCHAR(100) NOT NULL COMMENT "Status",
	seaGeographicalArea VARCHAR(100) NOT NULL,
	seaMarketAvailable VARCHAR(20) NOT NULL COMMENT "Marked available",
	seaSurveyTypeMain VARCHAR(100) NOT NULL COMMENT "Main type",
	seaSurveyTypePart VARCHAR(100) COMMENT "Sub type",
	seaCompanyReported VARCHAR(100) NOT NULL COMMENT "Company - responsible",
	seaSourceType VARCHAR(100) COMMENT "Source type",
	seaSourceNumber VARCHAR(100) COMMENT "Number of sources",
	seaSourceSize VARCHAR(100) COMMENT "Source size",
	seaSourcePressure VARCHAR(100) COMMENT "Source pressure",
	seaSensorType VARCHAR(100) COMMENT "Sensor type",
	seaSensorNumbers VARCHAR(40) COMMENT "Numbers of sensors",
	seaSensorLength VARCHAR(100) COMMENT "Sensor length [m]",
	seaPlanFromDate DATE NOT NULL COMMENT "Start date - planned",
	seaDateStarting DATE COMMENT "Start date - actual",
	seaPlanToDate DATE NOT NULL COMMENT "Completed date - planned",
	seaDateFinalized DATE COMMENT "Completed date - actual",
	seaPlanCdpKm INTEGER COMMENT "Total length - planned [cdp km]",
	seaCdpTotalKm INTEGER COMMENT "Total length - actual [cdp km]",
	seaPlanBoatKm INTEGER COMMENT "Total length - planned [boat km]",
	seaBoatTotalKm INTEGER COMMENT "Total length - actual [boat km]",
	sea3DKm2 DECIMAL(13,6) COMMENT "Total net area - planned 3D/4D [km2]",
	seaPolygonKind VARCHAR(100) NOT NULL COMMENT "Kind of polygon",
	seaPolyGeometryWKT POLYGON DEFAULT NULL,
	seaArea_id SERIAL,
	PRIMARY KEY (seaArea_id,seaSurveyName)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'seaArea' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/seaArea.csv"
INTO TABLE seaArea
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23,@var24,@var25,@var26,@var27,@var28)
SET `seaSurveyName` = @var1,
    `seaNpdidSurvey` = @var2,
    `seaFactMapUrl` = @var3,
    `seaFactPageUrl` = @var4,
    `seaStatus` = @var5,
    `seaGeographicalArea` = @var6,
    `seaMarketAvailable` = @var7,
    `seaSurveyTypeMain` = @var8,
    `seaSurveyTypePart` = @var9,
    `seaCompanyReported` = @var10,
    `seaSourceType` = @var11,
    `seaSourceNumber` = @var12,
    `seaSourceSize` = @var13,
    `seaSourcePressure` = @var14,
    `seaSensorType` = @var15,
    `seaSensorNumbers` = @var16,
    `seaSensorLength` = @var17,
    `seaPlanFromDate` = @var18,
    `seaDateStarting` = @var19,
    `seaPlanToDate` = @var20,
    `seaDateFinalized` = @var21,
    `seaPlanCdpKm` = @var22,
    `seaCdpTotalKm` = @var23,
    `seaPlanBoatKm` = @var24,
    `seaBoatTotalKm` = @var25,
    `sea3DKm2` = @var26,
    `seaPolygonKind` = @var27,
    `seaPolyGeometryWKT` = ST_GeomFromText(@var28);
SHOW WARNINGS;


CREATE TABLE wellbore_development_all (
	wlbWellboreName VARCHAR(40) NOT NULL COMMENT "Wellbore name",
	wlbWell VARCHAR(40) NOT NULL COMMENT "Well name",
	wlbDrillingOperator VARCHAR(60) NOT NULL COMMENT "Drilling operator",
	wlbDrillingOperatorGroup VARCHAR(20) NOT NULL COMMENT "Drilling operator group",
	wlbProductionLicence VARCHAR(40) NOT NULL COMMENT "Drilled in production licence",
	wlbPurposePlanned VARCHAR(40) COMMENT "Purpose - planned",
	wlbContent VARCHAR(40) COMMENT "Content",
	wlbWellType VARCHAR(20) NOT NULL COMMENT "Type",
	wlbEntryDate DATE COMMENT "Entry date",
	wlbCompletionDate DATE COMMENT "Completion date",
	wlbField VARCHAR(40) NOT NULL COMMENT "Field",
	wlbDrillPermit VARCHAR(10) NOT NULL COMMENT "Drill permit",
	wlbDiscovery VARCHAR(40) NOT NULL COMMENT "Discovery",
	wlbDiscoveryWellbore VARCHAR(3) NOT NULL COMMENT "Discovery wellbore",
	wlbKellyBushElevation DECIMAL(13,6) NOT NULL COMMENT "Kelly bushing elevation [m]",
	wlbFinalVerticalDepth DECIMAL(6,2) COMMENT "Final vertical depth (TVD) [m RKB]",
	wlbTotalDepth DECIMAL(13,6) NOT NULL COMMENT "Total depth (MD) [m RKB]",
	wlbWaterDepth DECIMAL(13,6) NOT NULL COMMENT "Water depth [m]",
	wlbMainArea VARCHAR(40) NOT NULL COMMENT "Main area",
	wlbDrillingFacility VARCHAR(50) COMMENT "Drilling facility",
	wlbFacilityTypeDrilling VARCHAR(40) COMMENT "Facility type, drilling",
	wlbProductionFacility VARCHAR(50) COMMENT "Production facility",
	wlbLicensingActivity VARCHAR(40) NOT NULL COMMENT "Licensing activity awarded in",
	wlbMultilateral VARCHAR(3) NOT NULL COMMENT "Multilateral",
	wlbContentPlanned VARCHAR(40) COMMENT "Content - planned",
	wlbEntryYear INTEGER NOT NULL COMMENT "Entry year",
	wlbCompletionYear INTEGER NOT NULL COMMENT "Completion year",
	wlbReclassFromWellbore VARCHAR(40) COMMENT "Reclassified from wellbore",
	wlbPlotSymbol INTEGER NOT NULL COMMENT "Plot symbol",
	wlbGeodeticDatum VARCHAR(6) COMMENT "Geodetic datum",
	wlbNsDeg INTEGER NOT NULL COMMENT "NS degrees",
	wlbNsMin INTEGER NOT NULL COMMENT "NS minutes",
	wlbNsSec DECIMAL(6,2) NOT NULL COMMENT "NS seconds",
	wlbNsCode VARCHAR(1) NOT NULL COMMENT "NS code",
	wlbEwDeg INTEGER NOT NULL COMMENT "EW degrees",
	wlbEwMin INTEGER NOT NULL COMMENT "EW minutes",
	wlbEwSec DECIMAL(6,2) NOT NULL COMMENT "EW seconds",
	wlbEwCode VARCHAR(1) COMMENT "EW code",
	wlbNsDecDeg DECIMAL(13,6) NOT NULL COMMENT "NS decimal degrees",
	wlbEwDesDeg DECIMAL(13,6) NOT NULL COMMENT "EW decimal degrees",
	wlbNsUtm DECIMAL(13,6) NOT NULL COMMENT "NS UTM [m]",
	wlbEwUtm DECIMAL(13,6) NOT NULL COMMENT "EW UTM [m]",
	wlbUtmZone INTEGER NOT NULL COMMENT "UTM zone",
	wlbNamePart1 INTEGER NOT NULL COMMENT "Wellbore name, part 1",
	wlbNamePart2 INTEGER NOT NULL COMMENT "Wellbore name, part 2",
	wlbNamePart3 VARCHAR(1) NOT NULL COMMENT "Wellbore name, part 3",
	wlbNamePart4 INTEGER NOT NULL COMMENT "Wellbore name, part 4",
	wlbNamePart5 VARCHAR(2) COMMENT "Wellbore name, part 5",
	wlbNamePart6 VARCHAR(2) COMMENT "Wellbore name, part 6",
	wlbFactPageUrl VARCHAR(200) NOT NULL COMMENT "FactPage url",
	wlbFactMapUrl VARCHAR(200) NOT NULL COMMENT "FactMap url",
	wlbDiskosWellboreType VARCHAR(20) NOT NULL COMMENT "DISKOS Well Type",
	wlbDiskosWellboreParent VARCHAR(40) COMMENT "DISKOS Wellbore Parent",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	dscNpdidDiscovery INTEGER NOT NULL COMMENT "NPDID discovery",
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	wlbWdssQcdate DATE,
	prlNpdidProductionLicence INTEGER NOT NULL COMMENT "NPDID production licence drilled in",
	fclNpdidFacilityDrilling INTEGER COMMENT "NPDID drilling facility",
	fclNpdidFacilityProducing INTEGER COMMENT "NPDID production facility",
	wlbNpdidWellboreReclass INTEGER NOT NULL COMMENT "NPDID wellbore reclassified from",
	wlbDiskosWellOperator VARCHAR(40) NOT NULL COMMENT "DISKOS well operator",
	wlbDateUpdated DATE NOT NULL COMMENT "Date main level updated",
	wlbDateUpdatedMax DATE NOT NULL COMMENT "Date all updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_development_all' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_development_all.csv"
INTO TABLE wellbore_development_all
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23,@var24,@var25,@var26,@var27,@var28,@var29,@var30,@var31,@var32,@var33,@var34,@var35,@var36,@var37,@var38,@var39,@var40,@var41,@var42,@var43,@var44,@var45,@var46,@var47,@var48,@var49,@var50,@var51,@var52,@var53,@var54,@var55,@var56,@var57,@var58,@var59,@var60,@var61,@var62,@var63,@var64,@var65)
SET `wlbWellboreName` = @var1,
    `wlbWell` = @var2,
    `wlbDrillingOperator` = @var3,
    `wlbDrillingOperatorGroup` = @var4,
    `wlbProductionLicence` = @var5,
    `wlbPurposePlanned` = @var6,
    `wlbContent` = @var7,
    `wlbWellType` = @var8,
    `wlbEntryDate` = @var9,
    `wlbCompletionDate` = @var10,
    `wlbField` = @var11,
    `wlbDrillPermit` = @var12,
    `wlbDiscovery` = @var13,
    `wlbDiscoveryWellbore` = @var14,
    `wlbKellyBushElevation` = @var15,
    `wlbFinalVerticalDepth` = @var16,
    `wlbTotalDepth` = @var17,
    `wlbWaterDepth` = @var18,
    `wlbMainArea` = @var19,
    `wlbDrillingFacility` = @var20,
    `wlbFacilityTypeDrilling` = @var21,
    `wlbProductionFacility` = @var22,
    `wlbLicensingActivity` = @var23,
    `wlbMultilateral` = @var24,
    `wlbContentPlanned` = @var25,
    `wlbEntryYear` = @var26,
    `wlbCompletionYear` = @var27,
    `wlbReclassFromWellbore` = @var28,
    `wlbPlotSymbol` = @var29,
    `wlbGeodeticDatum` = @var30,
    `wlbNsDeg` = @var31,
    `wlbNsMin` = @var32,
    `wlbNsSec` = @var33,
    `wlbNsCode` = @var34,
    `wlbEwDeg` = @var35,
    `wlbEwMin` = @var36,
    `wlbEwSec` = @var37,
    `wlbEwCode` = @var38,
    `wlbNsDecDeg` = @var39,
    `wlbEwDesDeg` = @var40,
    `wlbNsUtm` = @var41,
    `wlbEwUtm` = @var42,
    `wlbUtmZone` = @var43,
    `wlbNamePart1` = @var44,
    `wlbNamePart2` = @var45,
    `wlbNamePart3` = @var46,
    `wlbNamePart4` = @var47,
    `wlbNamePart5` = @var48,
    `wlbNamePart6` = @var49,
    `wlbFactPageUrl` = @var50,
    `wlbFactMapUrl` = @var51,
    `wlbDiskosWellboreType` = @var52,
    `wlbDiskosWellboreParent` = @var53,
    `wlbNpdidWellbore` = @var54,
    `dscNpdidDiscovery` = @var55,
    `fldNpdidField` = @var56,
    `wlbWdssQcdate` = @var57,
    `prlNpdidProductionLicence` = @var58,
    `fclNpdidFacilityDrilling` = @var59,
    `fclNpdidFacilityProducing` = @var60,
    `wlbNpdidWellboreReclass` = @var61,
    `wlbDiskosWellOperator` = @var62,
    `wlbDateUpdated` = @var63,
    `wlbDateUpdatedMax` = @var64,
    `dateSyncNPD` = @var65;
SHOW WARNINGS;


CREATE TABLE licence_petreg_message (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	ptlMessageDocumentNo INTEGER NOT NULL,
	ptlMessage TEXT NOT NULL COMMENT "Utdrag av dokument",
	ptlMessageRegisteredDate DATE NOT NULL COMMENT "Registreringsdato",
	ptlMessageKindDesc VARCHAR(100) NOT NULL COMMENT "Type",
	ptlMessageDateUpdated DATE COMMENT "Dato oppdatert",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,ptlMessageDocumentNo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_petreg_message' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_petreg_message.csv"
INTO TABLE licence_petreg_message
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `prlName` = @var1,
    `ptlMessageDocumentNo` = @var2,
    `ptlMessage` = @var3,
    `ptlMessageRegisteredDate` = @var4,
    `ptlMessageKindDesc` = @var5,
    `ptlMessageDateUpdated` = @var6,
    `prlNpdidLicence` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE fclPoint (
	fclNpdidFacility INTEGER NOT NULL COMMENT "NPDID facility",
	fclSurface VARCHAR(1) NOT NULL COMMENT "Surface facility",
	fclCurrentOperatorName VARCHAR(100) COMMENT "Current operator",
	fclName VARCHAR(40) NOT NULL COMMENT "Name",
	fclKind VARCHAR(40) NOT NULL COMMENT "Kind",
	fclBelongsToName VARCHAR(41) COMMENT "Belongs to, name",
	fclBelongsToKind VARCHAR(40) COMMENT "Belongs to, kind",
	fclBelongsToS INTEGER,
	fclStartupDate DATE NOT NULL COMMENT "Startup date",
	fclWaterDepth DECIMAL(13,6) NOT NULL COMMENT "Water depth [m]",
	fclFunctions VARCHAR(400) COMMENT "Functions",
	fclDesignLifetime INTEGER NOT NULL COMMENT "Design lifetime [year]",
	fclFactPageUrl VARCHAR(200) NOT NULL COMMENT "Fact page",
	fclFactMapUrl VARCHAR(200) NOT NULL COMMENT "Fact map",
	fclPointGeometryWKT POINT DEFAULT NULL,
	PRIMARY KEY (fclNpdidFacility)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'fclPoint' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/fclPoint.csv"
INTO TABLE fclPoint
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15)
SET `fclNpdidFacility` = @var1,
    `fclSurface` = @var2,
    `fclCurrentOperatorName` = @var3,
    `fclName` = @var4,
    `fclKind` = @var5,
    `fclBelongsToName` = @var6,
    `fclBelongsToKind` = @var7,
    `fclBelongsToS` = @var8,
    `fclStartupDate` = @var9,
    `fclWaterDepth` = @var10,
    `fclFunctions` = @var11,
    `fclDesignLifetime` = @var12,
    `fclFactPageUrl` = @var13,
    `fclFactMapUrl` = @var14,
    `fclPointGeometryWKT` = ST_GeomFromText(@var15);
SHOW WARNINGS;


CREATE TABLE field_operator_hst (
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	fldOperatorFrom DATE NOT NULL,
	fldOperatorTo DATE,
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	fldOperatorDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fldNpdidField,cmpNpdidCompany,fldOperatorFrom,fldOperatorTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_operator_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_operator_hst.csv"
INTO TABLE field_operator_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `fldName` = @var1,
    `cmpLongName` = @var2,
    `fldOperatorFrom` = @var3,
    `fldOperatorTo` = @var4,
    `fldNpdidField` = @var5,
    `cmpNpdidCompany` = @var6,
    `fldOperatorDateUpdated` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE licence_petreg_licence_licencee (
	ptlName VARCHAR(40) NOT NULL COMMENT "Tillatelse",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	ptlLicenseeInterest DECIMAL(13,6) NOT NULL COMMENT "Andel [%]",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	ptlLicenseeDateUpdated DATE COMMENT "Dato oppdatert",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,cmpNpdidCompany)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_petreg_licence_licencee' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_petreg_licence_licencee.csv"
INTO TABLE licence_petreg_licence_licencee
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7)
SET `ptlName` = @var1,
    `cmpLongName` = @var2,
    `ptlLicenseeInterest` = @var3,
    `prlNpdidLicence` = @var4,
    `cmpNpdidCompany` = @var5,
    `ptlLicenseeDateUpdated` = @var6,
    `dateSyncNPD` = @var7;
SHOW WARNINGS;


CREATE TABLE seis_acquisition_coordinates_inc_turnarea (
	seaSurveyName VARCHAR(100) NOT NULL COMMENT "Survey name",
	seaNpdidSurvey INTEGER NOT NULL COMMENT "NPDID for survey",
	seaPolygonPointNumber INTEGER NOT NULL COMMENT "Point number",
	seaPolygonNSDeg INTEGER NOT NULL COMMENT "NS degrees",
	seaPolygonNSMin INTEGER NOT NULL COMMENT "NS minutes",
	seaPolygonNSSec DECIMAL(13,6) NOT NULL COMMENT "NS seconds",
	seaPolygonEWDeg INTEGER NOT NULL COMMENT "EW degrees",
	seaPolygonEWMin INTEGER NOT NULL COMMENT "EW minutes",
	seaPolygonEWSec DECIMAL(13,6) NOT NULL COMMENT "EW seconds",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (seaSurveyName,seaPolygonPointNumber)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'seis_acquisition_coordinates_inc_turnarea' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/seis_acquisition_coordinates_inc_turnarea.csv"
INTO TABLE seis_acquisition_coordinates_inc_turnarea
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `seaSurveyName` = @var1,
    `seaNpdidSurvey` = @var2,
    `seaPolygonPointNumber` = @var3,
    `seaPolygonNSDeg` = @var4,
    `seaPolygonNSMin` = @var5,
    `seaPolygonNSSec` = @var6,
    `seaPolygonEWDeg` = @var7,
    `seaPolygonEWMin` = @var8,
    `seaPolygonEWSec` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE field_production_yearly (
	prfInformationCarrier VARCHAR(40) NOT NULL COMMENT "Field (Discovery)",
	prfYear INTEGER NOT NULL COMMENT "Year",
	prfPrdOilNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - oil [mill Sm3]",
	prfPrdGasNetBillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - gas [bill Sm3]",
	prfPrdNGLNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - NGL [mill Sm3]",
	prfPrdCondensateNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - condensate [mill Sm3]",
	prfPrdOeNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - oil equivalents [mill Sm3]",
	prfPrdProducedWaterInFieldMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Produced water in field [mill Sm3]",
	prfNpdidInformationCarrier INTEGER NOT NULL COMMENT "NPDID information carrier",
	PRIMARY KEY (prfNpdidInformationCarrier,prfYear)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_production_yearly' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_production_yearly.csv"
INTO TABLE field_production_yearly
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9)
SET `prfInformationCarrier` = @var1,
    `prfYear` = @var2,
    `prfPrdOilNetMillSm3` = @var3,
    `prfPrdGasNetBillSm3` = @var4,
    `prfPrdNGLNetMillSm3` = @var5,
    `prfPrdCondensateNetMillSm3` = @var6,
    `prfPrdOeNetMillSm3` = @var7,
    `prfPrdProducedWaterInFieldMillSm3` = @var8,
    `prfNpdidInformationCarrier` = @var9;
SHOW WARNINGS;

/*
CREATE TABLE pipLine (
	pipNpdidPipe INTEGER NOT NULL,
	pipNpdidFromFacility INTEGER NOT NULL,
	pipNpdidToFacility INTEGER NOT NULL,
	pipNpdidOperator INTEGER,
	pipName VARCHAR(50) NOT NULL,
	pipNameFromFacility VARCHAR(50) NOT NULL,
	pipNameToFacility VARCHAR(50) NOT NULL,
	pipNameCurrentOperator VARCHAR(100),
	pipCurrentPhase VARCHAR(40) NOT NULL,
	pipMedium VARCHAR(20) NOT NULL,
	pipMainGrouping VARCHAR(20) NOT NULL,
	pipDimension DECIMAL(13,6) NOT NULL,
	pipLineGeometryWKT LINESTRING DEFAULT NULL,
	PRIMARY KEY (pipNpdidPipe)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'pipLine' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/pipLine.csv"
INTO TABLE pipLine
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
#IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13)
SET `pipNpdidPipe` = @var1,
    `pipNpdidFromFacility` = @var2,
    `pipNpdidToFacility` = @var3,
    `pipNpdidOperator` = @var4,
    `pipName` = @var5,
    `pipNameFromFacility` = @var6,
    `pipNameToFacility` = @var7,
    `pipNameCurrentOperator` = @var8,
    `pipCurrentPhase` = @var9,
    `pipMedium` = @var10,
    `pipMainGrouping` = @var11,
    `pipDimension` = @var12,
    `pipLineGeometryWKT` = ST_GeomFromText(@var13);
SHOW WARNINGS;
*/
/*
CREATE TABLE dscArea (
	fldNpdidField INTEGER COMMENT "NPDID field",
	fldName VARCHAR(40) COMMENT "Field name",
	dscNpdidDiscovery INTEGER NOT NULL COMMENT "NPDID discovery",
	dscName VARCHAR(40) NOT NULL COMMENT "Discovery name",
	dscResInclInDiscoveryName VARCHAR(40) COMMENT "Resources incl. in",
	dscNpdidResInclInDiscovery INTEGER,
	dscIncludedInFld VARCHAR(3) NOT NULL,
	dscHcType VARCHAR(40) NOT NULL COMMENT "HC type",
	fldHcType VARCHAR(40),
	dscCurrentActivityStatus VARCHAR(40) NOT NULL COMMENT "Current activity status",
	fldCurrentActivityStatus VARCHAR(40),
	flddscLabel VARCHAR(40) NOT NULL,
	dscFactUrl VARCHAR(200) NOT NULL,
	fldFactUrl VARCHAR(200),
	flddscAreaGeometryWKT_ED50 MULTIPOLYGON DEFAULT NULL,
	PRIMARY KEY (dscNpdidDiscovery,dscHcType)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'dscArea' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/dscArea.csv"
INTO TABLE dscArea
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
# IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15)
SET `fldNpdidField` = @var1,
    `fldName` = @var2,
    `dscNpdidDiscovery` = @var3,
    `dscName` = @var4,
    `dscResInclInDiscoveryName` = @var5,
    `dscNpdidResInclInDiscovery` = @var6,
    `dscIncludedInFld` = @var7,
    `dscHcType` = @var8,
    `fldHcType` = @var9,
    `dscCurrentActivityStatus` = @var10,
    `fldCurrentActivityStatus` = @var11,
    `flddscLabel` = @var12,
    `dscFactUrl` = @var13,
    `fldFactUrl` = @var14,
    `flddscAreaGeometryWKT_ED50` = ST_GeomFromText(@var15);
SHOW WARNINGS;
*/

CREATE TABLE licence_task (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlTaskName VARCHAR(40) NOT NULL COMMENT "Task name (norwegian)",
	prlTaskTypeNo VARCHAR(100) NOT NULL,
	prlTaskTypeEn VARCHAR(200) NOT NULL COMMENT "Type of task",
	prlTaskStatusNo VARCHAR(100) NOT NULL,
	prlTaskStatusEn VARCHAR(40) NOT NULL COMMENT "Task status",
	prlTaskExpiryDate DATE NOT NULL COMMENT "Expiry date",
	wlbName VARCHAR(60) COMMENT "Wellbore name",
	prlDateValidTo DATE NOT NULL COMMENT "Date valid to",
	prlLicensingActivityName VARCHAR(40) NOT NULL COMMENT "Licensing activity",
	cmpLongName VARCHAR(200) COMMENT "Company name",
	cmpNpdidCompany INTEGER COMMENT "NPDID company",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	prlTaskID INTEGER NOT NULL COMMENT "Task ID",
	prlTaskRefID INTEGER COMMENT "Referred task ID",
	prlTaskDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,prlTaskID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_task' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_task.csv"
INTO TABLE licence_task
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17)
SET `prlName` = @var1,
    `prlTaskName` = @var2,
    `prlTaskTypeNo` = @var3,
    `prlTaskTypeEn` = @var4,
    `prlTaskStatusNo` = @var5,
    `prlTaskStatusEn` = @var6,
    `prlTaskExpiryDate` = @var7,
    `wlbName` = @var8,
    `prlDateValidTo` = @var9,
    `prlLicensingActivityName` = @var10,
    `cmpLongName` = @var11,
    `cmpNpdidCompany` = @var12,
    `prlNpdidLicence` = @var13,
    `prlTaskID` = @var14,
    `prlTaskRefID` = @var15,
    `prlTaskDateUpdated` = @var16,
    `dateSyncNPD` = @var17;
SHOW WARNINGS;


CREATE TABLE licence_oper_hst (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlOperDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	prlOperDateValidTo DATE COMMENT "Date valid to",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	prlOperDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,cmpNpdidCompany,prlOperDateValidFrom,prlOperDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_oper_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_oper_hst.csv"
INTO TABLE licence_oper_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `prlName` = @var1,
    `prlOperDateValidFrom` = @var2,
    `prlOperDateValidTo` = @var3,
    `cmpLongName` = @var4,
    `prlNpdidLicence` = @var5,
    `cmpNpdidCompany` = @var6,
    `prlOperDateUpdated` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE licence_phase_hst (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlDatePhaseValidFrom DATE COMMENT "Date phase valid from",
	prlDatePhaseValidTo DATE COMMENT "Date phase valid to",
	prlPhase VARCHAR(40) NOT NULL COMMENT "Phase",
	prlDateGranted DATE NOT NULL COMMENT "Date granted",
	prlDateValidTo DATE NOT NULL COMMENT "Date valid to",
	prlDateInitialPeriodExpires DATE NOT NULL COMMENT "Expiry date, initial period",
	prlActiveStatusIndicator VARCHAR(40) NOT NULL COMMENT "Active",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	prlPhaseDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,prlPhase,prlDatePhaseValidFrom,prlDatePhaseValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_phase_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_phase_hst.csv"
INTO TABLE licence_phase_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `prlName` = @var1,
    `prlDatePhaseValidFrom` = @var2,
    `prlDatePhaseValidTo` = @var3,
    `prlPhase` = @var4,
    `prlDateGranted` = @var5,
    `prlDateValidTo` = @var6,
    `prlDateInitialPeriodExpires` = @var7,
    `prlActiveStatusIndicator` = @var8,
    `prlNpdidLicence` = @var9,
    `prlPhaseDateUpdated` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;


CREATE TABLE wellbore_core_photo (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	wlbCoreNumber INTEGER NOT NULL COMMENT "Core sample number",
	wlbCorePhotoTitle VARCHAR(200) NOT NULL COMMENT "Core photo title",
	wlbCorePhotoImgUrl VARCHAR(200) NOT NULL COMMENT "Core photo URL",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbCorePhotoDateUpdated DATE COMMENT "Date updated",
	wellbore_core_photo_id SERIAL,
	PRIMARY KEY (wellbore_core_photo_id,wlbNpdidWellbore,wlbCoreNumber,wlbCorePhotoTitle)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_core_photo' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_core_photo.csv"
INTO TABLE wellbore_core_photo
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6)
SET `wlbName` = @var1,
    `wlbCoreNumber` = @var2,
    `wlbCorePhotoTitle` = @var3,
    `wlbCorePhotoImgUrl` = @var4,
    `wlbNpdidWellbore` = @var5,
    `wlbCorePhotoDateUpdated` = @var6;
SHOW WARNINGS;


CREATE TABLE baaArea (
	baaNpdidBsnsArrArea INTEGER NOT NULL COMMENT "NPDID Bsns. Arr. Area",
	baaNpdidBsnsArrAreaPoly INTEGER NOT NULL,
	baaName VARCHAR(40) NOT NULL COMMENT "Name",
	baaKind VARCHAR(40) NOT NULL COMMENT "Kind",
	baaAreaPolyDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	baaAreaPolyDateValidTo DATE COMMENT "Date valid to",
	baaAreaPolyActive VARCHAR(40) NOT NULL,
	baaDateApproved DATE NOT NULL COMMENT "Date approved",
	baaDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	baaDateValidTo DATE COMMENT "Date valid to",
	baaActive VARCHAR(20) NOT NULL COMMENT "Active",
	baaFactPageUrl VARCHAR(200) NOT NULL COMMENT "Fact page",
	baaFactMapUrl VARCHAR(200) COMMENT "Fact map",
	baaAreaGeometryWKT MULTIPOLYGON DEFAULT NULL,
	PRIMARY KEY (baaNpdidBsnsArrArea,baaNpdidBsnsArrAreaPoly)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'baaArea' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/baaArea.csv"
INTO TABLE baaArea
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14)
SET `baaNpdidBsnsArrArea` = @var1,
    `baaNpdidBsnsArrAreaPoly` = @var2,
    `baaName` = @var3,
    `baaKind` = @var4,
    `baaAreaPolyDateValidFrom` = @var5,
    `baaAreaPolyDateValidTo` = @var6,
    `baaAreaPolyActive` = @var7,
    `baaDateApproved` = @var8,
    `baaDateValidFrom` = @var9,
    `baaDateValidTo` = @var10,
    `baaActive` = @var11,
    `baaFactPageUrl` = @var12,
    `baaFactMapUrl` = @var13,
    `baaAreaGeometryWKT` = ST_GeomFromText(@var14);
SHOW WARNINGS;


CREATE TABLE bsns_arr_area_area_poly_hst (
	baaName VARCHAR(40) NOT NULL COMMENT "Name",
	baaAreaPolyDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	baaAreaPolyDateValidTo DATE COMMENT "Date valid to",
	baaAreaPolyNationCode2 VARCHAR(2) NOT NULL COMMENT "Nation code",
	baaAreaPolyBlockName VARCHAR(40) COMMENT "Block name",
	baaAreaPolyNo INTEGER NOT NULL,
	baaAreaPolyArea DECIMAL(13,6) NOT NULL COMMENT "Polygon area [km2]",
	baaNpdidBsnsArrArea INTEGER NOT NULL COMMENT "NPDID Bsns. Arr. Area",
	baaAreaPolyDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (baaNpdidBsnsArrArea,baaAreaPolyBlockName,baaAreaPolyNo,baaAreaPolyDateValidFrom,baaAreaPolyDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'bsns_arr_area_area_poly_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/bsns_arr_area_area_poly_hst.csv"
INTO TABLE bsns_arr_area_area_poly_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `baaName` = @var1,
    `baaAreaPolyDateValidFrom` = @var2,
    `baaAreaPolyDateValidTo` = @var3,
    `baaAreaPolyNationCode2` = @var4,
    `baaAreaPolyBlockName` = @var5,
    `baaAreaPolyNo` = @var6,
    `baaAreaPolyArea` = @var7,
    `baaNpdidBsnsArrArea` = @var8,
    `baaAreaPolyDateUpdated` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE field_activity_status_hst (
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	fldStatusFromDate DATE NOT NULL COMMENT "Status from",
	fldStatusToDate DATE COMMENT "Status to",
	fldStatus VARCHAR(40) NOT NULL COMMENT "Status",
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	fldStatusDateUpdated DATE,
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fldNpdidField,fldStatus,fldStatusFromDate,fldStatusToDate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_activity_status_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_activity_status_hst.csv"
INTO TABLE field_activity_status_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7)
SET `fldName` = @var1,
    `fldStatusFromDate` = @var2,
    `fldStatusToDate` = @var3,
    `fldStatus` = @var4,
    `fldNpdidField` = @var5,
    `fldStatusDateUpdated` = @var6,
    `dateSyncNPD` = @var7;
SHOW WARNINGS;


CREATE TABLE bsns_arr_area (
	baaName VARCHAR(40) NOT NULL COMMENT "Name",
	baaKind VARCHAR(40) NOT NULL COMMENT "Kind",
	baaDateApproved DATE NOT NULL COMMENT "Date approved",
	baaDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	baaDateValidTo DATE COMMENT "Date valid to",
	baaFactPageUrl VARCHAR(200) NOT NULL COMMENT "Fact page",
	baaFactMapUrl VARCHAR(200) COMMENT "Fact map",
	baaNpdidBsnsArrArea INTEGER NOT NULL COMMENT "NPDID Bsns. Arr. Area",
	baaDateUpdated DATE COMMENT "Date main level updated",
	baaDateUpdatedMax DATE COMMENT "Date all updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (baaNpdidBsnsArrArea)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'bsns_arr_area' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/bsns_arr_area.csv"
INTO TABLE bsns_arr_area
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `baaName` = @var1,
    `baaKind` = @var2,
    `baaDateApproved` = @var3,
    `baaDateValidFrom` = @var4,
    `baaDateValidTo` = @var5,
    `baaFactPageUrl` = @var6,
    `baaFactMapUrl` = @var7,
    `baaNpdidBsnsArrArea` = @var8,
    `baaDateUpdated` = @var9,
    `baaDateUpdatedMax` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;


CREATE TABLE bsns_arr_area_operator (
	baaName VARCHAR(40) NOT NULL COMMENT "Name",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	baaNpdidBsnsArrArea INTEGER NOT NULL COMMENT "NPDID Bsns. Arr. Area",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	baaOperatorDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (baaNpdidBsnsArrArea)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'bsns_arr_area_operator' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/bsns_arr_area_operator.csv"
INTO TABLE bsns_arr_area_operator
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6)
SET `baaName` = @var1,
    `cmpLongName` = @var2,
    `baaNpdidBsnsArrArea` = @var3,
    `cmpNpdidCompany` = @var4,
    `baaOperatorDateUpdated` = @var5,
    `dateSyncNPD` = @var6;
SHOW WARNINGS;


CREATE TABLE tuf_petreg_message (
	ptlName VARCHAR(40) NOT NULL COMMENT "Tillatelse",
	ptlMessageDocumentNo INTEGER NOT NULL,
	ptlMessage TEXT NOT NULL COMMENT "Utdrag av dokument",
	ptlMessageRegisteredDate DATE NOT NULL COMMENT "Registreringsdato",
	ptlMessageKindDesc VARCHAR(100) NOT NULL COMMENT "Type",
	tufName VARCHAR(40) NOT NULL COMMENT "TUF",
	ptlMessageDateUpdated DATE COMMENT "Dato oppdatert",
	tufNpdidTuf INTEGER NOT NULL COMMENT "NPDID tuf",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (tufNpdidTuf,ptlMessageDocumentNo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'tuf_petreg_message' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/tuf_petreg_message.csv"
INTO TABLE tuf_petreg_message
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9)
SET `ptlName` = @var1,
    `ptlMessageDocumentNo` = @var2,
    `ptlMessage` = @var3,
    `ptlMessageRegisteredDate` = @var4,
    `ptlMessageKindDesc` = @var5,
    `tufName` = @var6,
    `ptlMessageDateUpdated` = @var7,
    `tufNpdidTuf` = @var8,
    `dateSyncNPD` = @var9;
SHOW WARNINGS;


CREATE TABLE wellbore_casing_and_lot (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	wlbCasingType VARCHAR(10) COMMENT "Casing type",
	wlbCasingDiameter VARCHAR(6) COMMENT "Casing diam. [inch]",
	wlbCasingDepth DECIMAL(13,6) NOT NULL COMMENT "Casing depth [m]",
	wlbHoleDiameter VARCHAR(6) COMMENT "Hole diam. [inch]",
	wlbHoleDepth DECIMAL(13,6) NOT NULL COMMENT "Hole depth[m]",
	wlbLotMudDencity DECIMAL(13,6) NOT NULL COMMENT "LOT mud eqv. [g/cm3]",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbCasingDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	wellbore_casing_and_lot_id SERIAL,
	PRIMARY KEY (wellbore_casing_and_lot_id,wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_casing_and_lot' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_casing_and_lot.csv"
INTO TABLE wellbore_casing_and_lot
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `wlbName` = @var1,
    `wlbCasingType` = @var2,
    `wlbCasingDiameter` = @var3,
    `wlbCasingDepth` = @var4,
    `wlbHoleDiameter` = @var5,
    `wlbHoleDepth` = @var6,
    `wlbLotMudDencity` = @var7,
    `wlbNpdidWellbore` = @var8,
    `wlbCasingDateUpdated` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE field (
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	cmpLongName VARCHAR(200) COMMENT "Company name",
	fldCurrentActivitySatus VARCHAR(40) NOT NULL COMMENT "Current activity status",
	wlbName VARCHAR(60) COMMENT "Wellbore name",
	wlbCompletionDate DATE COMMENT "Completion date",
	fldOwnerKind VARCHAR(40) COMMENT "Owner kind",
	fldOwnerName VARCHAR(40) COMMENT "Owner name",
	fldNpdidOwner INTEGER COMMENT "NPDID owner",
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	cmpNpdidCompany INTEGER COMMENT "NPDID company",
	fldFactPageUrl VARCHAR(200) NOT NULL COMMENT "Field fact page",
	fldFactMapUrl VARCHAR(200) NOT NULL,
	fldDateUpdated DATE COMMENT "Date main level updated",
	fldDateUpdatedMax DATE COMMENT "Date all updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fldNpdidField)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field.csv"
INTO TABLE field
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16)
SET `fldName` = @var1,
    `cmpLongName` = @var2,
    `fldCurrentActivitySatus` = @var3,
    `wlbName` = @var4,
    `wlbCompletionDate` = @var5,
    `fldOwnerKind` = @var6,
    `fldOwnerName` = @var7,
    `fldNpdidOwner` = @var8,
    `fldNpdidField` = @var9,
    `wlbNpdidWellbore` = @var10,
    `cmpNpdidCompany` = @var11,
    `fldFactPageUrl` = @var12,
    `fldFactMapUrl` = @var13,
    `fldDateUpdated` = @var14,
    `fldDateUpdatedMax` = @var15,
    `dateSyncNPD` = @var16;
SHOW WARNINGS;


CREATE TABLE strat_litho_wellbore_core (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	lsuCoreLenght DECIMAL(13,6) NOT NULL COMMENT "Core length [m]",
	lsuName VARCHAR(20) NOT NULL COMMENT "Lithostrat. unit",
	lsuLevel VARCHAR(9) NOT NULL COMMENT "Level",
	wlbCompletionDate DATE NOT NULL COMMENT "Completion date",
	lsuNpdidLithoStrat INTEGER NOT NULL COMMENT "NPDID lithostrat. unit",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore,lsuNpdidLithoStrat)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'strat_litho_wellbore_core' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/strat_litho_wellbore_core.csv"
INTO TABLE strat_litho_wellbore_core
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `wlbName` = @var1,
    `lsuCoreLenght` = @var2,
    `lsuName` = @var3,
    `lsuLevel` = @var4,
    `wlbCompletionDate` = @var5,
    `lsuNpdidLithoStrat` = @var6,
    `wlbNpdidWellbore` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE seis_acquisition (
	seaName VARCHAR(100) NOT NULL COMMENT "Survey name",
	seaPlanFromDate DATE NOT NULL COMMENT "Start date - planned",
	seaNpdidSurvey INTEGER NOT NULL COMMENT "NPDID for survey",
	seaStatus VARCHAR(100) NOT NULL COMMENT "Status",
	seaGeographicalArea VARCHAR(100) NOT NULL,
	seaSurveyTypeMain VARCHAR(100) NOT NULL COMMENT "Main type",
	seaSurveyTypePart VARCHAR(100) COMMENT "Sub type",
	seaCompanyReported VARCHAR(100) NOT NULL COMMENT "Company - responsible",
	seaPlanToDate DATE NOT NULL COMMENT "Completed date - planned",
	seaDateStarting DATE COMMENT "Start date - actual",
	seaDateFinalized DATE COMMENT "Completed date - actual",
	seaCdpTotalKm INTEGER COMMENT "Total length - actual [cdp km]",
	seaBoatTotalKm INTEGER COMMENT "Total length - actual [boat km]",
	sea3DKm2 DECIMAL(13,6) COMMENT "Total net area - planned 3D/4D [km2]",
	seaSampling VARCHAR(20) COMMENT "Sampling",
	seaShallowDrilling VARCHAR(20) COMMENT "Shallow drilling",
	seaGeotechnical VARCHAR(20) COMMENT "Geotechnical measurement",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (seaNpdidSurvey,seaName)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'seis_acquisition' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/seis_acquisition.csv"
INTO TABLE seis_acquisition
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18)
SET `seaName` = @var1,
    `seaPlanFromDate` = @var2,
    `seaNpdidSurvey` = @var3,
    `seaStatus` = @var4,
    `seaGeographicalArea` = @var5,
    `seaSurveyTypeMain` = @var6,
    `seaSurveyTypePart` = @var7,
    `seaCompanyReported` = @var8,
    `seaPlanToDate` = @var9,
    `seaDateStarting` = @var10,
    `seaDateFinalized` = @var11,
    `seaCdpTotalKm` = @var12,
    `seaBoatTotalKm` = @var13,
    `sea3DKm2` = @var14,
    `seaSampling` = @var15,
    `seaShallowDrilling` = @var16,
    `seaGeotechnical` = @var17,
    `dateSyncNPD` = @var18;
SHOW WARNINGS;


CREATE TABLE tuf_petreg_licence (
	ptlName VARCHAR(40) NOT NULL COMMENT "Tillatelse",
	tufName VARCHAR(40) NOT NULL COMMENT "TUF",
	ptlDateValidFrom DATE NOT NULL COMMENT "Gyldig fra dato",
	ptlDateValidTo DATE NOT NULL COMMENT "Gyldig til dato",
	tufNpdidTuf INTEGER NOT NULL COMMENT "NPDID tuf",
	ptlDateUpdated DATE COMMENT "Dato hovednivå oppdatert",
	ptlDateUpdatedMax DATE NOT NULL COMMENT "Dato alle oppdatert",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (tufNpdidTuf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'tuf_petreg_licence' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/tuf_petreg_licence.csv"
INTO TABLE tuf_petreg_licence
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `ptlName` = @var1,
    `tufName` = @var2,
    `ptlDateValidFrom` = @var3,
    `ptlDateValidTo` = @var4,
    `tufNpdidTuf` = @var5,
    `ptlDateUpdated` = @var6,
    `ptlDateUpdatedMax` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE licence_area_poly_hst (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlAreaPolyDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	prlAreaPolyDateValidTo DATE COMMENT "Date valid to",
	prlAreaPolyNationCode VARCHAR(2) NOT NULL,
	prlAreaPolyBlockName VARCHAR(40) NOT NULL COMMENT "Block name",
	prlAreaPolyStratigraphical VARCHAR(4) NOT NULL COMMENT "Stratigraphcal",
	prlAreaPolyPolyNo INTEGER NOT NULL,
	prlAreaPolyPolyArea DECIMAL(13,6) NOT NULL COMMENT "Polygon area [km2]",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	prlAreaDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,prlAreaPolyBlockName,prlAreaPolyPolyNo,prlAreaPolyDateValidFrom,prlAreaPolyDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_area_poly_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_area_poly_hst.csv"
INTO TABLE licence_area_poly_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `prlName` = @var1,
    `prlAreaPolyDateValidFrom` = @var2,
    `prlAreaPolyDateValidTo` = @var3,
    `prlAreaPolyNationCode` = @var4,
    `prlAreaPolyBlockName` = @var5,
    `prlAreaPolyStratigraphical` = @var6,
    `prlAreaPolyPolyNo` = @var7,
    `prlAreaPolyPolyArea` = @var8,
    `prlNpdidLicence` = @var9,
    `prlAreaDateUpdated` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;

/*
CREATE TABLE seaMultiline (
	seaSurveyName VARCHAR(100) NOT NULL COMMENT "Survey name",
	seaFactMapUrl VARCHAR(260) COMMENT "Fact Map",
	seaFactPageUrl VARCHAR(200),
	seaStatus VARCHAR(100) NOT NULL COMMENT "Status",
	seaMarketAvailable VARCHAR(20) NOT NULL COMMENT "Marked available",
	seaSurveyTypeMain VARCHAR(100) NOT NULL COMMENT "Main type",
	seaSurveyTypePart VARCHAR(100) NOT NULL COMMENT "Sub type",
	seaCompanyReported VARCHAR(100) NOT NULL COMMENT "Company - responsible",
	seaSourceType VARCHAR(100) NOT NULL COMMENT "Source type",
	seaSourceNumber VARCHAR(100) COMMENT "Number of sources",
	seaSourceSize VARCHAR(100) COMMENT "Source size",
	seaSourcePressure VARCHAR(100) COMMENT "Source pressure",
	seaSensorType VARCHAR(100) NOT NULL COMMENT "Sensor type",
	seaSensorNumbers VARCHAR(40) NOT NULL COMMENT "Numbers of sensors",
	seaSensorLength VARCHAR(100) NOT NULL COMMENT "Sensor length [m]",
	seaPlanFromDate DATE NOT NULL COMMENT "Start date - planned",
	seaDateStarting DATE COMMENT "Start date - actual",
	seaPlanToDate DATE NOT NULL COMMENT "Completed date - planned",
	seaDateFinalized DATE COMMENT "Completed date - actual",
	seaPlanCdpKm INTEGER NOT NULL COMMENT "Total length - planned [cdp km]",
	seaCdpTotalKm INTEGER COMMENT "Total length - actual [cdp km]",
	seaPlanBoatKm INTEGER NOT NULL COMMENT "Total length - planned [boat km]",
	seaBoatTotalKm INTEGER COMMENT "Total length - actual [boat km]",
	seaMultilineGeometryWKT MULTILINESTRING DEFAULT NULL,
	PRIMARY KEY (seaSurveyName)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'seaMultiline' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/seaMultiline.csv"
INTO TABLE seaMultiline
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23,@var24)
SET `seaSurveyName` = @var1,
    `seaFactMapUrl` = @var2,
    `seaFactPageUrl` = @var3,
    `seaStatus` = @var4,
    `seaMarketAvailable` = @var5,
    `seaSurveyTypeMain` = @var6,
    `seaSurveyTypePart` = @var7,
    `seaCompanyReported` = @var8,
    `seaSourceType` = @var9,
    `seaSourceNumber` = @var10,
    `seaSourceSize` = @var11,
    `seaSourcePressure` = @var12,
    `seaSensorType` = @var13,
    `seaSensorNumbers` = @var14,
    `seaSensorLength` = @var15,
    `seaPlanFromDate` = @var16,
    `seaDateStarting` = @var17,
    `seaPlanToDate` = @var18,
    `seaDateFinalized` = @var19,
    `seaPlanCdpKm` = @var20,
    `seaCdpTotalKm` = @var21,
    `seaPlanBoatKm` = @var22,
    `seaBoatTotalKm` = @var23,
    `seaMultilineGeometryWKT` = ST_GeomFromText(@var24);
SHOW WARNINGS;
*/

CREATE TABLE licence_petreg_licence_oper (
	ptlName VARCHAR(40) NOT NULL COMMENT "Tillatelse",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	ptlOperDateUpdated DATE COMMENT "Dato oppdatert",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_petreg_licence_oper' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_petreg_licence_oper.csv"
INTO TABLE licence_petreg_licence_oper
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6)
SET `ptlName` = @var1,
    `cmpLongName` = @var2,
    `prlNpdidLicence` = @var3,
    `cmpNpdidCompany` = @var4,
    `ptlOperDateUpdated` = @var5,
    `dateSyncNPD` = @var6;
SHOW WARNINGS;

/*
CREATE TABLE prlArea (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlActive VARCHAR(20) NOT NULL COMMENT "Active",
	prlCurrentArea VARCHAR(20) NOT NULL COMMENT "Current area",
	prlDateGranted DATE NOT NULL COMMENT "Date granted",
	prlDateValidTo DATE NOT NULL COMMENT "Date valid to",
	prlAreaPolyDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	prlAreaPolyDateValidTo DATE COMMENT "Date valid to",
	prlAreaPolyFromZvalue INTEGER NOT NULL,
	prlAreaPolyToZvalue INTEGER NOT NULL,
	prlAreaPolyVertLimEn TEXT,
	prlAreaPolyVertLimNo TEXT,
	prlStratigraphical VARCHAR(3) NOT NULL,
	prlAreaPolyStratigraphical VARCHAR(4) NOT NULL COMMENT "Stratigraphcal",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	prlLastOperatorNameShort VARCHAR(40) NOT NULL,
	prlLastOperatorNameLong VARCHAR(200) NOT NULL,
	prlLicensingActivityName VARCHAR(40) NOT NULL COMMENT "Licensing activity",
	prlLastOperatorNpdidCompany INTEGER NOT NULL,
	prlFactUrl VARCHAR(200) NOT NULL,
	prlAreaGeometryWKT MULTIPOLYGON DEFAULT NULL,
	prlArea_id SERIAL,
	PRIMARY KEY (prlArea_id,prlNpdidLicence,prlAreaPolyDateValidFrom,prlAreaPolyDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'prlArea' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/prlArea.csv"
INTO TABLE prlArea
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20)
SET `prlName` = @var1,
    `prlActive` = @var2,
    `prlCurrentArea` = @var3,
    `prlDateGranted` = @var4,
    `prlDateValidTo` = @var5,
    `prlAreaPolyDateValidFrom` = @var6,
    `prlAreaPolyDateValidTo` = @var7,
    `prlAreaPolyFromZvalue` = @var8,
    `prlAreaPolyToZvalue` = @var9,
    `prlAreaPolyVertLimEn` = @var10,
    `prlAreaPolyVertLimNo` = @var11,
    `prlStratigraphical` = @var12,
    `prlAreaPolyStratigraphical` = @var13,
    `prlNpdidLicence` = @var14,
    `prlLastOperatorNameShort` = @var15,
    `prlLastOperatorNameLong` = @var16,
    `prlLicensingActivityName` = @var17,
    `prlLastOperatorNpdidCompany` = @var18,
    `prlFactUrl` = @var19,
    `prlAreaGeometryWKT` = ST_GeomFromText(@var20);
SHOW WARNINGS;
*/

CREATE TABLE seis_acquisition_progress (
	seaProgressDate DATE NOT NULL,
	seaProgressText2 VARCHAR(40) NOT NULL,
	seaProgressText TEXT NOT NULL,
	seaProgressDescription TEXT,
	seaNpdidSurvey INTEGER NOT NULL COMMENT "NPDID for survey",
	seis_acquisition_progress_id SERIAL,
	PRIMARY KEY (seis_acquisition_progress_id,seaProgressText2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'seis_acquisition_progress' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/seis_acquisition_progress.csv"
INTO TABLE seis_acquisition_progress
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5)
SET `seaProgressDate` = @var1,
    `seaProgressText2` = @var2,
    `seaProgressText` = @var3,
    `seaProgressDescription` = @var4,
    `seaNpdidSurvey` = @var5;
SHOW WARNINGS;


CREATE TABLE tuf_petreg_licence_oper (
	Textbox42 VARCHAR(20) NOT NULL,
	Textbox2 VARCHAR(20) NOT NULL,
	ptlName VARCHAR(40) NOT NULL COMMENT "Tillatelse",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	tufName VARCHAR(40) NOT NULL COMMENT "TUF",
	tufNpdidTuf INTEGER NOT NULL COMMENT "NPDID tuf",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	ptlOperDateUpdated DATE COMMENT "Dato oppdatert",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (tufNpdidTuf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'tuf_petreg_licence_oper' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/tuf_petreg_licence_oper.csv"
INTO TABLE tuf_petreg_licence_oper
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9)
SET `Textbox42` = @var1,
    `Textbox2` = @var2,
    `ptlName` = @var3,
    `cmpLongName` = @var4,
    `tufName` = @var5,
    `tufNpdidTuf` = @var6,
    `cmpNpdidCompany` = @var7,
    `ptlOperDateUpdated` = @var8,
    `dateSyncNPD` = @var9;
SHOW WARNINGS;


CREATE TABLE wellbore_shallow_all (
	wlbWellboreName VARCHAR(40) NOT NULL COMMENT "Wellbore name",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbWell VARCHAR(40) NOT NULL COMMENT "Well name",
	wlbDrillingOperator VARCHAR(60) NOT NULL COMMENT "Drilling operator",
	wlbProductionLicence VARCHAR(40) COMMENT "Drilled in production licence",
	wlbDrillingFacility VARCHAR(50) COMMENT "Drilling facility",
	wlbEntryDate DATE COMMENT "Entry date",
	wlbCompletionDate DATE COMMENT "Completion date",
	wlbDrillPermit VARCHAR(10) NOT NULL COMMENT "Drill permit",
	wlbTotalDepth DECIMAL(13,6) NOT NULL COMMENT "Total depth (MD) [m RKB]",
	wlbWaterDepth DECIMAL(13,6) NOT NULL COMMENT "Water depth [m]",
	wlbMainArea VARCHAR(40) NOT NULL COMMENT "Main area",
	wlbEntryYear INTEGER NOT NULL COMMENT "Entry year",
	wlbCompletionYear INTEGER NOT NULL COMMENT "Completion year",
	wlbSeismicLocation VARCHAR(200) COMMENT "Seismic location",
	wlbGeodeticDatum VARCHAR(6) COMMENT "Geodetic datum",
	wlbNsDeg INTEGER NOT NULL COMMENT "NS degrees",
	wlbNsMin INTEGER NOT NULL COMMENT "NS minutes",
	wlbNsSec DECIMAL(6,2) NOT NULL COMMENT "NS seconds",
	wlbNsCode VARCHAR(1) COMMENT "NS code",
	wlbEwDeg INTEGER NOT NULL COMMENT "EW degrees",
	wlbEwMin INTEGER NOT NULL COMMENT "EW minutes",
	wlbEwSec DECIMAL(6,2) NOT NULL COMMENT "EW seconds",
	wlbEwCode VARCHAR(1) COMMENT "EW code",
	wlbNsDecDeg DECIMAL(13,6) NOT NULL COMMENT "NS decimal degrees",
	wlbEwDesDeg DECIMAL(13,6) NOT NULL COMMENT "EW decimal degrees",
	wlbNsUtm DECIMAL(13,6) NOT NULL COMMENT "NS UTM [m]",
	wlbEwUtm DECIMAL(13,6) NOT NULL COMMENT "EW UTM [m]",
	wlbUtmZone INTEGER NOT NULL COMMENT "UTM zone",
	wlbNamePart1 INTEGER NOT NULL COMMENT "Wellbore name, part 1",
	wlbNamePart2 INTEGER NOT NULL COMMENT "Wellbore name, part 2",
	wlbNamePart3 VARCHAR(1) NOT NULL COMMENT "Wellbore name, part 3",
	wlbNamePart4 INTEGER NOT NULL COMMENT "Wellbore name, part 4",
	wlbNamePart5 VARCHAR(2) COMMENT "Wellbore name, part 5",
	wlbNamePart6 VARCHAR(2) COMMENT "Wellbore name, part 6",
	wlbDateUpdated DATE NOT NULL COMMENT "Date main level updated",
	wlbDateUpdatedMax DATE NOT NULL COMMENT "Date all updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_shallow_all' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_shallow_all.csv"
INTO TABLE wellbore_shallow_all
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23,@var24,@var25,@var26,@var27,@var28,@var29,@var30,@var31,@var32,@var33,@var34,@var35,@var36,@var37,@var38)
SET `wlbWellboreName` = @var1,
    `wlbNpdidWellbore` = @var2,
    `wlbWell` = @var3,
    `wlbDrillingOperator` = @var4,
    `wlbProductionLicence` = @var5,
    `wlbDrillingFacility` = @var6,
    `wlbEntryDate` = @var7,
    `wlbCompletionDate` = @var8,
    `wlbDrillPermit` = @var9,
    `wlbTotalDepth` = @var10,
    `wlbWaterDepth` = @var11,
    `wlbMainArea` = @var12,
    `wlbEntryYear` = @var13,
    `wlbCompletionYear` = @var14,
    `wlbSeismicLocation` = @var15,
    `wlbGeodeticDatum` = @var16,
    `wlbNsDeg` = @var17,
    `wlbNsMin` = @var18,
    `wlbNsSec` = @var19,
    `wlbNsCode` = @var20,
    `wlbEwDeg` = @var21,
    `wlbEwMin` = @var22,
    `wlbEwSec` = @var23,
    `wlbEwCode` = @var24,
    `wlbNsDecDeg` = @var25,
    `wlbEwDesDeg` = @var26,
    `wlbNsUtm` = @var27,
    `wlbEwUtm` = @var28,
    `wlbUtmZone` = @var29,
    `wlbNamePart1` = @var30,
    `wlbNamePart2` = @var31,
    `wlbNamePart3` = @var32,
    `wlbNamePart4` = @var33,
    `wlbNamePart5` = @var34,
    `wlbNamePart6` = @var35,
    `wlbDateUpdated` = @var36,
    `wlbDateUpdatedMax` = @var37,
    `dateSyncNPD` = @var38;
SHOW WARNINGS;


CREATE TABLE licence_licensee_hst (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlLicenseeDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	prlLicenseeDateValidTo DATE COMMENT "Date valid to",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	prlLicenseeInterest DECIMAL(13,6) NOT NULL COMMENT "Interest [%]",
	prlLicenseeSdfi DECIMAL(13,6) COMMENT "SDFI [%]",
	prlOperDateValidFrom DATE COMMENT "Date valid from",
	prlOperDateValidTo DATE COMMENT "Date valid to",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	prlLicenseeDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,cmpNpdidCompany,prlLicenseeDateValidFrom,prlLicenseeDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_licensee_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_licensee_hst.csv"
INTO TABLE licence_licensee_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12)
SET `prlName` = @var1,
    `prlLicenseeDateValidFrom` = @var2,
    `prlLicenseeDateValidTo` = @var3,
    `cmpLongName` = @var4,
    `prlLicenseeInterest` = @var5,
    `prlLicenseeSdfi` = @var6,
    `prlOperDateValidFrom` = @var7,
    `prlOperDateValidTo` = @var8,
    `prlNpdidLicence` = @var9,
    `cmpNpdidCompany` = @var10,
    `prlLicenseeDateUpdated` = @var11,
    `dateSyncNPD` = @var12;
SHOW WARNINGS;


CREATE TABLE field_description (
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	fldDescriptionHeading VARCHAR(255) NOT NULL COMMENT "Heading",
	fldDescriptionText LONGTEXT NOT NULL COMMENT "Text",
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	fldDescriptionDateUpdated DATE NOT NULL COMMENT "Date updated",
	PRIMARY KEY (fldNpdidField,fldDescriptionHeading)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_description' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_description.csv"
INTO TABLE field_description
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5)
SET `fldName` = @var1,
    `fldDescriptionHeading` = @var2,
    `fldDescriptionText` = @var3,
    `fldNpdidField` = @var4,
    `fldDescriptionDateUpdated` = @var5;
SHOW WARNINGS;


CREATE TABLE facility_fixed (
	fclName VARCHAR(40) NOT NULL COMMENT "Name",
	fclPhase VARCHAR(40) NOT NULL COMMENT "Phase",
	fclSurface VARCHAR(1) NOT NULL COMMENT "Surface facility",
	fclCurrentOperatorName VARCHAR(100) COMMENT "Current operator",
	fclKind VARCHAR(40) NOT NULL COMMENT "Kind",
	fclBelongsToName VARCHAR(41) COMMENT "Belongs to, name",
	fclBelongsToKind VARCHAR(40) COMMENT "Belongs to, kind",
	fclBelongsToS INTEGER,
	fclStartupDate DATE COMMENT "Startup date",
	fclGeodeticDatum VARCHAR(10) COMMENT "Geodetic datum",
	fclNsDeg INTEGER COMMENT "NS degrees",
	fclNsMin INTEGER COMMENT "NS minutes",
	fclNsSec DECIMAL(13,6) COMMENT "NS seconds",
	fclNsCode VARCHAR(1) NOT NULL COMMENT "NS code",
	fclEwDeg INTEGER COMMENT "EW degrees",
	fclEwMin INTEGER COMMENT "EW minutes",
	fclEwSec DECIMAL(13,6) COMMENT "EW seconds",
	fclEwCode VARCHAR(1) NOT NULL COMMENT "EW code",
	fclWaterDepth DECIMAL(13,6) NOT NULL COMMENT "Water depth [m]",
	fclFunctions VARCHAR(400) COMMENT "Functions",
	fclDesignLifetime INTEGER COMMENT "Design lifetime [year]",
	fclFactPageUrl VARCHAR(200) NOT NULL COMMENT "Fact page",
	fclFactMapUrl VARCHAR(200) NOT NULL COMMENT "Fact map",
	fclNpdidFacility INTEGER NOT NULL COMMENT "NPDID facility",
	fclDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fclNpdidFacility)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'facility_fixed' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/facility_fixed.csv"
INTO TABLE facility_fixed
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23,@var24,@var25,@var26)
SET `fclName` = @var1,
    `fclPhase` = @var2,
    `fclSurface` = @var3,
    `fclCurrentOperatorName` = @var4,
    `fclKind` = @var5,
    `fclBelongsToName` = @var6,
    `fclBelongsToKind` = @var7,
    `fclBelongsToS` = @var8,
    `fclStartupDate` = @var9,
    `fclGeodeticDatum` = @var10,
    `fclNsDeg` = @var11,
    `fclNsMin` = @var12,
    `fclNsSec` = @var13,
    `fclNsCode` = @var14,
    `fclEwDeg` = @var15,
    `fclEwMin` = @var16,
    `fclEwSec` = @var17,
    `fclEwCode` = @var18,
    `fclWaterDepth` = @var19,
    `fclFunctions` = @var20,
    `fclDesignLifetime` = @var21,
    `fclFactPageUrl` = @var22,
    `fclFactMapUrl` = @var23,
    `fclNpdidFacility` = @var24,
    `fclDateUpdated` = @var25,
    `dateSyncNPD` = @var26;
SHOW WARNINGS;


CREATE TABLE field_production_monthly (
	prfInformationCarrier VARCHAR(40) NOT NULL COMMENT "Field (Discovery)",
	prfYear INTEGER NOT NULL COMMENT "Year",
	prfMonth INTEGER NOT NULL COMMENT "Month",
	prfPrdOilNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - oil [mill Sm3]",
	prfPrdGasNetBillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - gas [bill Sm3]",
	prfPrdNGLNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - NGL [mill Sm3]",
	prfPrdCondensateNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - condensate [mill Sm3]",
	prfPrdOeNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - oil equivalents [mill Sm3]",
	prfPrdProducedWaterInFieldMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Produced water in field [mill Sm3]",
	prfNpdidInformationCarrier INTEGER NOT NULL COMMENT "NPDID information carrier",
	PRIMARY KEY (prfNpdidInformationCarrier,prfYear,prfMonth)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_production_monthly' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_production_monthly.csv"
INTO TABLE field_production_monthly
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `prfInformationCarrier` = @var1,
    `prfYear` = @var2,
    `prfMonth` = @var3,
    `prfPrdOilNetMillSm3` = @var4,
    `prfPrdGasNetBillSm3` = @var5,
    `prfPrdNGLNetMillSm3` = @var6,
    `prfPrdCondensateNetMillSm3` = @var7,
    `prfPrdOeNetMillSm3` = @var8,
    `prfPrdProducedWaterInFieldMillSm3` = @var9,
    `prfNpdidInformationCarrier` = @var10;
SHOW WARNINGS;


CREATE TABLE bsns_arr_area_transfer_hst (
	baaName VARCHAR(40) NOT NULL COMMENT "Name",
	baaTransferDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	baaTransferDirection VARCHAR(4) NOT NULL COMMENT "Transfer direction",
	baaTransferKind VARCHAR(40) COMMENT "Transfer kind",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	baaTransferredInterest DECIMAL(13,6) NOT NULL COMMENT "Transferred interest [%]",
	baaTransferSdfi DECIMAL(13,6) COMMENT "SDFI [%]",
	baaNpdidBsnsArrArea INTEGER NOT NULL COMMENT "NPDID Bsns. Arr. Area",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	baaTransferDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (baaNpdidBsnsArrArea,baaTransferDirection,cmpNpdidCompany,baaTransferDateValidFrom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'bsns_arr_area_transfer_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/bsns_arr_area_transfer_hst.csv"
INTO TABLE bsns_arr_area_transfer_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `baaName` = @var1,
    `baaTransferDateValidFrom` = @var2,
    `baaTransferDirection` = @var3,
    `baaTransferKind` = @var4,
    `cmpLongName` = @var5,
    `baaTransferredInterest` = @var6,
    `baaTransferSdfi` = @var7,
    `baaNpdidBsnsArrArea` = @var8,
    `cmpNpdidCompany` = @var9,
    `baaTransferDateUpdated` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;


CREATE TABLE field_production_totalt_NCS_month (
	prfYear INTEGER NOT NULL COMMENT "Year",
	prfMonth INTEGER NOT NULL COMMENT "Month",
	prfPrdOilNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - oil [mill Sm3]",
	prfPrdGasNetBillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - gas [bill Sm3]",
	prfPrdNGLNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - NGL [mill Sm3]",
	prfPrdCondensateNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - condensate [mill Sm3]",
	prfPrdOeNetMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Net - oil equivalents [mill Sm3]",
	prfPrdProducedWaterInFieldMillSm3 DECIMAL(13,6) NOT NULL COMMENT "Produced water in field [mill Sm3]",
	PRIMARY KEY (prfYear,prfMonth)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_production_totalt_NCS_month' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_production_totalt_NCS_month.csv"
INTO TABLE field_production_totalt_NCS_month
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `prfYear` = @var1,
    `prfMonth` = @var2,
    `prfPrdOilNetMillSm3` = @var3,
    `prfPrdGasNetBillSm3` = @var4,
    `prfPrdNGLNetMillSm3` = @var5,
    `prfPrdCondensateNetMillSm3` = @var6,
    `prfPrdOeNetMillSm3` = @var7,
    `prfPrdProducedWaterInFieldMillSm3` = @var8;
SHOW WARNINGS;


CREATE TABLE facility_moveable (
	fclName VARCHAR(40) NOT NULL COMMENT "Name",
	fclCurrentRespCompanyName VARCHAR(100) COMMENT "Current responsible company",
	fclKind VARCHAR(40) NOT NULL COMMENT "Kind",
	fclFunctions VARCHAR(400) COMMENT "Functions",
	fclNationName VARCHAR(40) NOT NULL COMMENT "Nation",
	fclFactPageUrl VARCHAR(200) NOT NULL COMMENT "Fact page",
	fclNpdidFacility INTEGER NOT NULL COMMENT "NPDID facility",
	fclNpdidCurrentRespCompany INTEGER COMMENT "NPDID responsible company",
	fclDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fclNpdidFacility)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'facility_moveable' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/facility_moveable.csv"
INTO TABLE facility_moveable
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `fclName` = @var1,
    `fclCurrentRespCompanyName` = @var2,
    `fclKind` = @var3,
    `fclFunctions` = @var4,
    `fclNationName` = @var5,
    `fclFactPageUrl` = @var6,
    `fclNpdidFacility` = @var7,
    `fclNpdidCurrentRespCompany` = @var8,
    `fclDateUpdated` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE licence_transfer_hst (
	prlName VARCHAR(50) NOT NULL COMMENT "Production licence",
	prlTransferDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	prlTransferDirection VARCHAR(4) NOT NULL COMMENT "Transfer direction",
	prlTransferKind VARCHAR(40) COMMENT "Transfer kind",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	prlTransferredInterest DECIMAL(13,6) NOT NULL COMMENT "Transferred interest [%]",
	prlTransferSdfi DECIMAL(13,6) COMMENT "SDFI [%]",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	prlTransferDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence,prlTransferDirection,cmpNpdidCompany,prlTransferDateValidFrom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_transfer_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_transfer_hst.csv"
INTO TABLE licence_transfer_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11)
SET `prlName` = @var1,
    `prlTransferDateValidFrom` = @var2,
    `prlTransferDirection` = @var3,
    `prlTransferKind` = @var4,
    `cmpLongName` = @var5,
    `prlTransferredInterest` = @var6,
    `prlTransferSdfi` = @var7,
    `prlNpdidLicence` = @var8,
    `cmpNpdidCompany` = @var9,
    `prlTransferDateUpdated` = @var10,
    `dateSyncNPD` = @var11;
SHOW WARNINGS;


CREATE TABLE wellbore_document (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	wlbDocumentType VARCHAR(40) NOT NULL COMMENT "Document type",
	wlbDocumentName VARCHAR(200) NOT NULL COMMENT "Document name",
	wlbDocumentUrl VARCHAR(200) NOT NULL COMMENT "Document URL",
	wlbDocumentFormat VARCHAR(40) NOT NULL COMMENT "Document format",
	wlbDocumentSize DECIMAL(13,6) NOT NULL COMMENT "Document size [MB]",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbDocumentDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	wellbore_document_id SERIAL,
	PRIMARY KEY (wellbore_document_id,wlbNpdidWellbore,wlbDocumentName)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_document' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_document.csv"
INTO TABLE wellbore_document
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9)
SET `wlbName` = @var1,
    `wlbDocumentType` = @var2,
    `wlbDocumentName` = @var3,
    `wlbDocumentUrl` = @var4,
    `wlbDocumentFormat` = @var5,
    `wlbDocumentSize` = @var6,
    `wlbNpdidWellbore` = @var7,
    `wlbDocumentDateUpdated` = @var8,
    `dateSyncNPD` = @var9;
SHOW WARNINGS;


CREATE TABLE company (
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	cmpOrgNumberBrReg VARCHAR(100) COMMENT "Organisation number",
	cmpGroup VARCHAR(100) COMMENT "Group",
	cmpShortName VARCHAR(40) NOT NULL COMMENT "Company shortname",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	cmpLicenceOperCurrent VARCHAR(1) NOT NULL COMMENT "Currently licence operator",
	cmpLicenceOperFormer VARCHAR(1) NOT NULL COMMENT "Former licence operator",
	cmpLicenceLicenseeCurrent VARCHAR(1) NOT NULL COMMENT "Currently licence licensee",
	cmpLicenceLicenseeFormer VARCHAR(1) NOT NULL COMMENT "Former licence licensee",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (cmpNpdidCompany)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'company' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/company.csv"
INTO TABLE company
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `cmpLongName` = @var1,
    `cmpOrgNumberBrReg` = @var2,
    `cmpGroup` = @var3,
    `cmpShortName` = @var4,
    `cmpNpdidCompany` = @var5,
    `cmpLicenceOperCurrent` = @var6,
    `cmpLicenceOperFormer` = @var7,
    `cmpLicenceLicenseeCurrent` = @var8,
    `cmpLicenceLicenseeFormer` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE apaAreaNet (
	blkId INTEGER NOT NULL,
	blkLabel VARCHAR(40) NOT NULL,
	qdrName VARCHAR(40) NOT NULL,
	blkName VARCHAR(40) NOT NULL,
	prvName VARCHAR(2) NOT NULL,
	apaAreaType VARCHAR(40),
	urlNPD VARCHAR(200) NOT NULL,
	apaAreaNetGeometryWKT POLYGON DEFAULT NULL,
	apaAreaNet_id SERIAL,
	PRIMARY KEY (apaAreaNet_id,qdrName,blkName,prvName,blkId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'apaAreaNet' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/apaAreaNet.csv"
INTO TABLE apaAreaNet
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `blkId` = @var1,
    `blkLabel` = @var2,
    `qdrName` = @var3,
    `blkName` = @var4,
    `prvName` = @var5,
    `apaAreaType` = @var6,
    `urlNPD` = @var7,
    `apaAreaNetGeometryWKT` = ST_GeomFromText(@var8);
SHOW WARNINGS;


CREATE TABLE field_reserves (
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	fldRecoverableOil DECIMAL(13,6) NOT NULL COMMENT "Orig. recoverable oil [mill Sm3]",
	fldRecoverableGas DECIMAL(13,6) NOT NULL COMMENT "Orig. recoverable gas [bill Sm3]",
	fldRecoverableNGL DECIMAL(13,6) NOT NULL COMMENT "Orig. recoverable NGL [mill tonn]",
	fldRecoverableCondensate DECIMAL(13,6) NOT NULL COMMENT "Orig. recoverable cond. [mill Sm3]",
	fldRecoverableOE DECIMAL(13,6) NOT NULL COMMENT "Orig. recoverable oil eq. [mill Sm3 o.e]",
	fldRemainingOil DECIMAL(13,6) NOT NULL COMMENT "Remaining oil [mill Sm3]",
	fldRemainingGas DECIMAL(13,6) NOT NULL COMMENT "Remaining gas [bill Sm3]",
	fldRemainingNGL DECIMAL(13,6) NOT NULL COMMENT "Remaining NGL [mill tonn]",
	fldRemainingCondensate DECIMAL(13,6) NOT NULL COMMENT "Remaining cond. [mill Sm3]",
	fldRemainingOE DECIMAL(13,6) NOT NULL COMMENT "Remaining oil eq. [mill Sm3 o.e]",
	fldDateOffResEstDisplay DATE NOT NULL COMMENT "Reserves updated date",
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fldNpdidField)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_reserves' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_reserves.csv"
INTO TABLE field_reserves
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14)
SET `fldName` = @var1,
    `fldRecoverableOil` = @var2,
    `fldRecoverableGas` = @var3,
    `fldRecoverableNGL` = @var4,
    `fldRecoverableCondensate` = @var5,
    `fldRecoverableOE` = @var6,
    `fldRemainingOil` = @var7,
    `fldRemainingGas` = @var8,
    `fldRemainingNGL` = @var9,
    `fldRemainingCondensate` = @var10,
    `fldRemainingOE` = @var11,
    `fldDateOffResEstDisplay` = @var12,
    `fldNpdidField` = @var13,
    `dateSyncNPD` = @var14;
SHOW WARNINGS;


CREATE TABLE wellbore_exploration_all (
	wlbWellboreName VARCHAR(40) NOT NULL COMMENT "Wellbore name",
	wlbWell VARCHAR(40) NOT NULL COMMENT "Well name",
	wlbDrillingOperator VARCHAR(60) NOT NULL COMMENT "Drilling operator",
	wlbDrillingOperatorGroup VARCHAR(20) NOT NULL COMMENT "Drilling operator group",
	wlbProductionLicence VARCHAR(40) NOT NULL COMMENT "Drilled in production licence",
	wlbPurpose VARCHAR(40) NOT NULL COMMENT "Purpose",
	wlbStatus VARCHAR(40) COMMENT "Status",
	wlbContent VARCHAR(40) COMMENT "Content",
	wlbWellType VARCHAR(20) NOT NULL COMMENT "Type",
	wlbEntryDate DATE COMMENT "Entry date",
	wlbCompletionDate DATE COMMENT "Completion date",
	wlbField VARCHAR(40) COMMENT "Field",
	wlbDrillPermit VARCHAR(10) NOT NULL COMMENT "Drill permit",
	wlbDiscovery VARCHAR(40) COMMENT "Discovery",
	wlbDiscoveryWellbore VARCHAR(3) NOT NULL COMMENT "Discovery wellbore",
	wlbBottomHoleTemperature INTEGER COMMENT "Bottom hole temperature [°C]",
	wlbSeismicLocation VARCHAR(200) COMMENT "Seismic location",
	wlbMaxInclation DECIMAL(6,2) COMMENT "Maximum inclination [°]",
	wlbKellyBushElevation DECIMAL(13,6) NOT NULL COMMENT "Kelly bushing elevation [m]",
	wlbFinalVerticalDepth DECIMAL(6,2) COMMENT "Final vertical depth (TVD) [m RKB]",
	wlbTotalDepth DECIMAL(13,6) NOT NULL COMMENT "Total depth (MD) [m RKB]",
	wlbWaterDepth DECIMAL(13,6) NOT NULL COMMENT "Water depth [m]",
	wlbAgeAtTd VARCHAR(40) COMMENT "Oldest penetrated age",
	wlbFormationAtTd VARCHAR(40) COMMENT "Oldest penetrated formation",
	wlbMainArea VARCHAR(40) NOT NULL COMMENT "Main area",
	wlbDrillingFacility VARCHAR(50) NOT NULL COMMENT "Drilling facility",
	wlbFacilityTypeDrilling VARCHAR(40) NOT NULL COMMENT "Facility type, drilling",
	wlbLicensingActivity VARCHAR(40) NOT NULL COMMENT "Licensing activity awarded in",
	wlbMultilateral VARCHAR(3) NOT NULL COMMENT "Multilateral",
	wlbPurposePlanned VARCHAR(40) NOT NULL COMMENT "Purpose - planned",
	wlbEntryYear INTEGER NOT NULL COMMENT "Entry year",
	wlbCompletionYear INTEGER NOT NULL COMMENT "Completion year",
	wlbReclassFromWellbore VARCHAR(40) COMMENT "Reclassified from wellbore",
	wlbReentryExplorationActivity VARCHAR(40) COMMENT "Reentry activity",
	wlbPlotSymbol INTEGER NOT NULL COMMENT "Plot symbol",
	wlbFormationWithHc1 VARCHAR(20) COMMENT "1st level with HC, formation",
	wlbAgeWithHc1 VARCHAR(20) COMMENT "1st level with HC, age",
	wlbFormationWithHc2 VARCHAR(20) COMMENT "2nd level with HC, formation",
	wlbAgeWithHc2 VARCHAR(20) COMMENT "2nd level with HC, age",
	wlbFormationWithHc3 VARCHAR(20) COMMENT "3rd level with HC, formation",
	wlbAgeWithHc3 CHAR(20) COMMENT "3rd level with HC, age",
	wlbDrillingDays INTEGER NOT NULL COMMENT "Drilling days",
	wlbReentry VARCHAR(3) NOT NULL COMMENT "Reentry",
	wlbGeodeticDatum VARCHAR(6) COMMENT "Geodetic datum",
	wlbNsDeg INTEGER NOT NULL COMMENT "NS degrees",
	wlbNsMin INTEGER NOT NULL COMMENT "NS minutes",
	wlbNsSec DECIMAL(6,2) NOT NULL COMMENT "NS seconds",
	wlbNsCode VARCHAR(1) NOT NULL COMMENT "NS code",
	wlbEwDeg INTEGER NOT NULL COMMENT "EW degrees",
	wlbEwMin INTEGER NOT NULL COMMENT "EW minutes",
	wlbEwSec DECIMAL(6,2) NOT NULL COMMENT "EW seconds",
	wlbEwCode VARCHAR(1) NOT NULL COMMENT "EW code",
	wlbNsDecDeg DECIMAL(13,6) NOT NULL COMMENT "NS decimal degrees",
	wlbEwDesDeg DECIMAL(13,6) NOT NULL COMMENT "EW decimal degrees",
	wlbNsUtm DECIMAL(13,6) NOT NULL COMMENT "NS UTM [m]",
	wlbEwUtm DECIMAL(13,6) NOT NULL COMMENT "EW UTM [m]",
	wlbUtmZone INTEGER NOT NULL COMMENT "UTM zone",
	wlbNamePart1 INTEGER NOT NULL COMMENT "Wellbore name, part 1",
	wlbNamePart2 INTEGER NOT NULL COMMENT "Wellbore name, part 2",
	wlbNamePart3 VARCHAR(1) COMMENT "Wellbore name, part 3",
	wlbNamePart4 INTEGER NOT NULL COMMENT "Wellbore name, part 4",
	wlbNamePart5 VARCHAR(2) COMMENT "Wellbore name, part 5",
	wlbNamePart6 VARCHAR(2) COMMENT "Wellbore name, part 6",
	wlbPressReleaseUrl VARCHAR(200),
	wlbFactPageUrl VARCHAR(200) NOT NULL COMMENT "FactPage url",
	wlbFactMapUrl VARCHAR(200) NOT NULL COMMENT "FactMap url",
	wlbDiskosWellboreType VARCHAR(20) NOT NULL COMMENT "DISKOS Well Type",
	wlbDiskosWellboreParent VARCHAR(40) COMMENT "DISKOS Wellbore Parent",
	wlbWdssQcDate DATE COMMENT "WDSS QC date",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	dscNpdidDiscovery INTEGER COMMENT "NPDID discovery",
	fldNpdidField INTEGER COMMENT "NPDID field",
	fclNpdidFacilityDrilling INTEGER NOT NULL COMMENT "NPDID drilling facility",
	wlbNpdidWellboreReclass INTEGER NOT NULL COMMENT "NPDID wellbore reclassified from",
	prlNpdidProductionLicence INTEGER NOT NULL COMMENT "NPDID production licence drilled in",
	wlbDiskosWellOperator VARCHAR(40) NOT NULL COMMENT "DISKOS well operator",
	wlbDateUpdated DATE NOT NULL COMMENT "Date main level updated",
	wlbDateUpdatedMax DATE NOT NULL COMMENT "Date all updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_exploration_all' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_exploration_all.csv"
INTO TABLE wellbore_exploration_all
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23,@var24,@var25,@var26,@var27,@var28,@var29,@var30,@var31,@var32,@var33,@var34,@var35,@var36,@var37,@var38,@var39,@var40,@var41,@var42,@var43,@var44,@var45,@var46,@var47,@var48,@var49,@var50,@var51,@var52,@var53,@var54,@var55,@var56,@var57,@var58,@var59,@var60,@var61,@var62,@var63,@var64,@var65,@var66,@var67,@var68,@var69,@var70,@var71,@var72,@var73,@var74,@var75,@var76,@var77,@var78,@var79)
SET `wlbWellboreName` = @var1,
    `wlbWell` = @var2,
    `wlbDrillingOperator` = @var3,
    `wlbDrillingOperatorGroup` = @var4,
    `wlbProductionLicence` = @var5,
    `wlbPurpose` = @var6,
    `wlbStatus` = @var7,
    `wlbContent` = @var8,
    `wlbWellType` = @var9,
    `wlbEntryDate` = @var10,
    `wlbCompletionDate` = @var11,
    `wlbField` = @var12,
    `wlbDrillPermit` = @var13,
    `wlbDiscovery` = @var14,
    `wlbDiscoveryWellbore` = @var15,
    `wlbBottomHoleTemperature` = @var16,
    `wlbSeismicLocation` = @var17,
    `wlbMaxInclation` = @var18,
    `wlbKellyBushElevation` = @var19,
    `wlbFinalVerticalDepth` = @var20,
    `wlbTotalDepth` = @var21,
    `wlbWaterDepth` = @var22,
    `wlbAgeAtTd` = @var23,
    `wlbFormationAtTd` = @var24,
    `wlbMainArea` = @var25,
    `wlbDrillingFacility` = @var26,
    `wlbFacilityTypeDrilling` = @var27,
    `wlbLicensingActivity` = @var28,
    `wlbMultilateral` = @var29,
    `wlbPurposePlanned` = @var30,
    `wlbEntryYear` = @var31,
    `wlbCompletionYear` = @var32,
    `wlbReclassFromWellbore` = @var33,
    `wlbReentryExplorationActivity` = @var34,
    `wlbPlotSymbol` = @var35,
    `wlbFormationWithHc1` = @var36,
    `wlbAgeWithHc1` = @var37,
    `wlbFormationWithHc2` = @var38,
    `wlbAgeWithHc2` = @var39,
    `wlbFormationWithHc3` = @var40,
    `wlbAgeWithHc3` = @var41,
    `wlbDrillingDays` = @var42,
    `wlbReentry` = @var43,
    `wlbGeodeticDatum` = @var44,
    `wlbNsDeg` = @var45,
    `wlbNsMin` = @var46,
    `wlbNsSec` = @var47,
    `wlbNsCode` = @var48,
    `wlbEwDeg` = @var49,
    `wlbEwMin` = @var50,
    `wlbEwSec` = @var51,
    `wlbEwCode` = @var52,
    `wlbNsDecDeg` = @var53,
    `wlbEwDesDeg` = @var54,
    `wlbNsUtm` = @var55,
    `wlbEwUtm` = @var56,
    `wlbUtmZone` = @var57,
    `wlbNamePart1` = @var58,
    `wlbNamePart2` = @var59,
    `wlbNamePart3` = @var60,
    `wlbNamePart4` = @var61,
    `wlbNamePart5` = @var62,
    `wlbNamePart6` = @var63,
    `wlbPressReleaseUrl` = @var64,
    `wlbFactPageUrl` = @var65,
    `wlbFactMapUrl` = @var66,
    `wlbDiskosWellboreType` = @var67,
    `wlbDiskosWellboreParent` = @var68,
    `wlbWdssQcDate` = @var69,
    `wlbNpdidWellbore` = @var70,
    `dscNpdidDiscovery` = @var71,
    `fldNpdidField` = @var72,
    `fclNpdidFacilityDrilling` = @var73,
    `wlbNpdidWellboreReclass` = @var74,
    `prlNpdidProductionLicence` = @var75,
    `wlbDiskosWellOperator` = @var76,
    `wlbDateUpdated` = @var77,
    `wlbDateUpdatedMax` = @var78,
    `dateSyncNPD` = @var79;
SHOW WARNINGS;


CREATE TABLE field_licensee_hst (
	fldName VARCHAR(40) NOT NULL COMMENT "Field name",
	fldOwnerName VARCHAR(40) NOT NULL COMMENT "Owner name",
	fldOwnerKind VARCHAR(40) NOT NULL COMMENT "Owner kind",
	fldOwnerFrom DATE NOT NULL,
	fldOwnerTo DATE,
	fldLicenseeFrom DATE NOT NULL,
	fldLicenseeTo DATE,
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	fldCompanyShare DECIMAL(13,6) NOT NULL COMMENT "Company share [%]",
	fldSdfiShare DECIMAL(13,6) COMMENT "SDFI [%]",
	fldNpdidField INTEGER NOT NULL COMMENT "NPDID field",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	fldLicenseeDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (fldNpdidField,cmpNpdidCompany,fldLicenseeFrom,fldLicenseeTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'field_licensee_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/field_licensee_hst.csv"
INTO TABLE field_licensee_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14)
SET `fldName` = @var1,
    `fldOwnerName` = @var2,
    `fldOwnerKind` = @var3,
    `fldOwnerFrom` = @var4,
    `fldOwnerTo` = @var5,
    `fldLicenseeFrom` = @var6,
    `fldLicenseeTo` = @var7,
    `cmpLongName` = @var8,
    `fldCompanyShare` = @var9,
    `fldSdfiShare` = @var10,
    `fldNpdidField` = @var11,
    `cmpNpdidCompany` = @var12,
    `fldLicenseeDateUpdated` = @var13,
    `dateSyncNPD` = @var14;
SHOW WARNINGS;


CREATE TABLE licence_petreg_licence (
	ptlName VARCHAR(40) NOT NULL COMMENT "Tillatelse",
	ptlDateAwarded DATE NOT NULL,
	ptlDateValidFrom DATE NOT NULL COMMENT "Gyldig fra dato",
	ptlDateValidTo DATE NOT NULL COMMENT "Gyldig til dato",
	prlNpdidLicence INTEGER NOT NULL COMMENT "NPDID production licence",
	ptlDateUpdated DATE COMMENT "Dato hovednivå oppdatert",
	ptlDateUpdatedMax DATE NOT NULL COMMENT "Dato alle oppdatert",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (prlNpdidLicence)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'licence_petreg_licence' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/licence_petreg_licence.csv"
INTO TABLE licence_petreg_licence
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8)
SET `ptlName` = @var1,
    `ptlDateAwarded` = @var2,
    `ptlDateValidFrom` = @var3,
    `ptlDateValidTo` = @var4,
    `prlNpdidLicence` = @var5,
    `ptlDateUpdated` = @var6,
    `ptlDateUpdatedMax` = @var7,
    `dateSyncNPD` = @var8;
SHOW WARNINGS;


CREATE TABLE wellbore_mud (
	wlbName VARCHAR(60) NOT NULL COMMENT "Wellbore name",
	wlbMD DECIMAL(13,6) NOT NULL COMMENT "Depth MD [m]",
	wlbMudWeightAtMD DECIMAL(13,6) NOT NULL COMMENT "Mud weight [g/cm3]",
	wlbMudViscosityAtMD DECIMAL(13,6) NOT NULL COMMENT "Visc. [mPa.s]",
	wlbYieldPointAtMD DECIMAL(13,6) NOT NULL COMMENT "Yield point [Pa]",
	wlbMudType VARCHAR(40) COMMENT "Mud type",
	wlbMudDateMeasured DATE COMMENT "Date measured",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	wlbMudDateUpdated DATE COMMENT "Date updated",
	dateSyncNPD DATE NOT NULL,
	wellbore_mud_id SERIAL,
	PRIMARY KEY (wellbore_mud_id,wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_mud' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_mud.csv"
INTO TABLE wellbore_mud
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10)
SET `wlbName` = @var1,
    `wlbMD` = @var2,
    `wlbMudWeightAtMD` = @var3,
    `wlbMudViscosityAtMD` = @var4,
    `wlbYieldPointAtMD` = @var5,
    `wlbMudType` = @var6,
    `wlbMudDateMeasured` = @var7,
    `wlbNpdidWellbore` = @var8,
    `wlbMudDateUpdated` = @var9,
    `dateSyncNPD` = @var10;
SHOW WARNINGS;


CREATE TABLE tuf_operator_hst (
	tufName VARCHAR(40) NOT NULL COMMENT "TUF",
	cmpLongName VARCHAR(200) NOT NULL COMMENT "Company name",
	tufOperDateValidFrom DATE NOT NULL COMMENT "Date valid from",
	tufOperDateValidTo DATE COMMENT "Date valid to",
	tufNpdidTuf INTEGER NOT NULL COMMENT "NPDID tuf",
	cmpNpdidCompany INTEGER NOT NULL COMMENT "NPDID company",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (tufNpdidTuf,cmpNpdidCompany,tufOperDateValidFrom,tufOperDateValidTo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'tuf_operator_hst' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/tuf_operator_hst.csv"
INTO TABLE tuf_operator_hst
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7)
SET `tufName` = @var1,
    `cmpLongName` = @var2,
    `tufOperDateValidFrom` = @var3,
    `tufOperDateValidTo` = @var4,
    `tufNpdidTuf` = @var5,
    `cmpNpdidCompany` = @var6,
    `dateSyncNPD` = @var7;
SHOW WARNINGS;


CREATE TABLE wellbore_coordinates (
	wlbWellboreName VARCHAR(40) NOT NULL COMMENT "Wellbore name",
	wlbDrillingOperator VARCHAR(60) NOT NULL COMMENT "Drilling operator",
	wlbProductionLicence VARCHAR(40) COMMENT "Drilled in production licence",
	wlbWellType VARCHAR(20) COMMENT "Type",
	wlbPurposePlanned VARCHAR(40) COMMENT "Purpose - planned",
	wlbContent VARCHAR(40) COMMENT "Content",
	wlbEntryDate DATE COMMENT "Entry date",
	wlbCompletionDate DATE COMMENT "Completion date",
	wlbField VARCHAR(40) COMMENT "Field",
	wlbMainArea VARCHAR(40) NOT NULL COMMENT "Main area",
	wlbGeodeticDatum VARCHAR(6) COMMENT "Geodetic datum",
	wlbNsDeg INTEGER NOT NULL COMMENT "NS degrees",
	wlbNsMin INTEGER NOT NULL COMMENT "NS minutes",
	wlbNsSec DECIMAL(6,2) NOT NULL COMMENT "NS seconds",
	wlbNsCode VARCHAR(1) COMMENT "NS code",
	wlbEwDeg INTEGER NOT NULL COMMENT "EW degrees",
	wlbEwMin INTEGER NOT NULL COMMENT "EW minutes",
	wlbEwSec DECIMAL(6,2) NOT NULL COMMENT "EW seconds",
	wlbEwCode VARCHAR(1) COMMENT "EW code",
	wlbNsDecDeg DECIMAL(13,6) NOT NULL COMMENT "NS decimal degrees",
	wlbEwDesDeg DECIMAL(13,6) NOT NULL COMMENT "EW decimal degrees",
	wlbNsUtm DECIMAL(13,6) NOT NULL COMMENT "NS UTM [m]",
	wlbEwUtm DECIMAL(13,6) NOT NULL COMMENT "EW UTM [m]",
	wlbUtmZone INTEGER NOT NULL COMMENT "UTM zone",
	wlbNpdidWellbore INTEGER NOT NULL COMMENT "NPDID wellbore",
	dateSyncNPD DATE NOT NULL,
	PRIMARY KEY (wlbNpdidWellbore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT 'wellbore_coordinates' AS '';
LOAD DATA LOCAL INFILE "C:/Users/YZhang147/Documents/GitHub/npd-factpages/data/clean.csv/wellbore_coordinates.csv"
INTO TABLE wellbore_coordinates
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1,@var2,@var3,@var4,@var5,@var6,@var7,@var8,@var9,@var10,@var11,@var12,@var13,@var14,@var15,@var16,@var17,@var18,@var19,@var20,@var21,@var22,@var23,@var24,@var25,@var26)
SET `wlbWellboreName` = @var1,
    `wlbDrillingOperator` = @var2,
    `wlbProductionLicence` = @var3,
    `wlbWellType` = @var4,
    `wlbPurposePlanned` = @var5,
    `wlbContent` = @var6,
    `wlbEntryDate` = @var7,
    `wlbCompletionDate` = @var8,
    `wlbField` = @var9,
    `wlbMainArea` = @var10,
    `wlbGeodeticDatum` = @var11,
    `wlbNsDeg` = @var12,
    `wlbNsMin` = @var13,
    `wlbNsSec` = @var14,
    `wlbNsCode` = @var15,
    `wlbEwDeg` = @var16,
    `wlbEwMin` = @var17,
    `wlbEwSec` = @var18,
    `wlbEwCode` = @var19,
    `wlbNsDecDeg` = @var20,
    `wlbEwDesDeg` = @var21,
    `wlbNsUtm` = @var22,
    `wlbEwUtm` = @var23,
    `wlbUtmZone` = @var24,
    `wlbNpdidWellbore` = @var25,
    `dateSyncNPD` = @var26;
SHOW WARNINGS;


-- Add indexes

CREATE        INDEX index__company__cmpLongName             ON company (cmpLongName);
CREATE        INDEX index__company__cmpShortName            ON company (cmpShortName);
CREATE UNIQUE INDEX index__licence__prlName                 ON licence (prlName);
CREATE UNIQUE INDEX index__bsns_arr_area__baaName           ON bsns_arr_area (baaName);
CREATE UNIQUE INDEX index__seis_acquisition__seaName        ON seis_acquisition (seaName);
CREATE        INDEX index__wellbore_formation_top__lsuName  ON wellbore_formation_top (lsuName);
CREATE        INDEX index__licence_task__prlTaskID          ON licence_task (prlTaskID);

-- End
ALTER TABLE discovery_reserves ADD FOREIGN KEY (dscNpdidDiscovery) REFERENCES discovery(dscNpdidDiscovery);
ALTER TABLE wellbore_core ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE field_investment_yearly ADD FOREIGN KEY (prfNpdidInformationCarrier) REFERENCES field(fldNpdidField);
ALTER TABLE company_reserves ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE company_reserves ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE wellbore_formation_top ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE strat_litho_wellbore ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE tuf_owner_hst ADD FOREIGN KEY (tufNpdidTuf) REFERENCES tuf_petreg_licence(tufNpdidTuf);
ALTER TABLE tuf_owner_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
#ALTER TABLE fldArea ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
#ALTER TABLE fldArea ADD FOREIGN KEY (dscNpdidDiscovery) REFERENCES discovery(dscNpdidDiscovery);
#ALTER TABLE fldArea ADD FOREIGN KEY (dscNpdidResInclInDiscovery) REFERENCES discovery(dscNpdidDiscovery);
ALTER TABLE field_owner_hst ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE wlbPoint ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE prlAreaSplitByBlock ADD FOREIGN KEY (prlLastOperatorNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE prlAreaSplitByBlock ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE tuf_petreg_licence_licencee ADD FOREIGN KEY (tufNpdidTuf) REFERENCES tuf_petreg_licence(tufNpdidTuf);
ALTER TABLE tuf_petreg_licence_licencee ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE discovery ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE discovery ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE bsns_arr_area_licensee_hst ADD FOREIGN KEY (baaNpdidBsnsArrArea) REFERENCES bsns_arr_area(baaNpdidBsnsArrArea);
ALTER TABLE bsns_arr_area_licensee_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE wellbore_dst ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE wellbore_oil_sample ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE seaArea ADD FOREIGN KEY (seaNpdidSurvey) REFERENCES seis_acquisition(seaNpdidSurvey);
ALTER TABLE wellbore_development_all ADD FOREIGN KEY (wlbDrillingOperator) REFERENCES company(cmpLongName);
ALTER TABLE wellbore_development_all ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE wellbore_development_all ADD FOREIGN KEY (dscNpdidDiscovery) REFERENCES discovery(dscNpdidDiscovery);
ALTER TABLE wellbore_development_all ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE wellbore_development_all ADD FOREIGN KEY (prlNpdidProductionLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE wellbore_development_all ADD FOREIGN KEY (wlbNpdidWellboreReclass) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE wellbore_development_all ADD FOREIGN KEY (wlbDiskosWellOperator) REFERENCES company(cmpShortName);
ALTER TABLE licence_petreg_message ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE fclPoint ADD FOREIGN KEY (fclNpdidFacility) REFERENCES facility_fixed(fclNpdidFacility);
ALTER TABLE fclPoint ADD FOREIGN KEY (fclBelongsToS) REFERENCES tuf_petreg_licence(tufNpdidTuf);
ALTER TABLE field_operator_hst ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE field_operator_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE licence_petreg_licence_licencee ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE licence_petreg_licence_licencee ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE seis_acquisition_coordinates_inc_turnarea ADD FOREIGN KEY (seaNpdidSurvey) REFERENCES seis_acquisition(seaNpdidSurvey);
#ALTER TABLE pipLine ADD FOREIGN KEY (pipNpdidOperator) REFERENCES company(cmpNpdidCompany);
#ALTER TABLE dscArea ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
#ALTER TABLE dscArea ADD FOREIGN KEY (dscNpdidDiscovery) REFERENCES discovery(dscNpdidDiscovery);
#ALTER TABLE dscArea ADD FOREIGN KEY (dscNpdidResInclInDiscovery) REFERENCES discovery(dscNpdidDiscovery);
ALTER TABLE licence_task ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE licence_task ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE licence_task ADD FOREIGN KEY (prlTaskRefID) REFERENCES licence_task(prlTaskID);
ALTER TABLE licence_oper_hst ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE licence_oper_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE licence_phase_hst ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE wellbore_core_photo ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE baaArea ADD FOREIGN KEY (baaNpdidBsnsArrArea) REFERENCES bsns_arr_area(baaNpdidBsnsArrArea);
ALTER TABLE bsns_arr_area_area_poly_hst ADD FOREIGN KEY (baaNpdidBsnsArrArea) REFERENCES bsns_arr_area(baaNpdidBsnsArrArea);
ALTER TABLE field_activity_status_hst ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE bsns_arr_area_operator ADD FOREIGN KEY (baaNpdidBsnsArrArea) REFERENCES bsns_arr_area(baaNpdidBsnsArrArea);
ALTER TABLE bsns_arr_area_operator ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE tuf_petreg_message ADD FOREIGN KEY (tufNpdidTuf) REFERENCES tuf_petreg_licence(tufNpdidTuf);
ALTER TABLE wellbore_casing_and_lot ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE field ADD FOREIGN KEY (fldNpdidOwner) REFERENCES licence(prlNpdidLicence);
ALTER TABLE field ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE field ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE strat_litho_wellbore_core ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE seis_acquisition ADD FOREIGN KEY (seaCompanyReported) REFERENCES company(cmpLongName);
ALTER TABLE licence_area_poly_hst ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
#ALTER TABLE seaMultiline ADD FOREIGN KEY (seaSurveyName) REFERENCES seis_acquisition(seaName);
ALTER TABLE licence_petreg_licence_oper ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE licence_petreg_licence_oper ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
#ALTER TABLE prlArea ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
#ALTER TABLE prlArea ADD FOREIGN KEY (prlLastOperatorNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE seis_acquisition_progress ADD FOREIGN KEY (seaNpdidSurvey) REFERENCES seis_acquisition(seaNpdidSurvey);
ALTER TABLE tuf_petreg_licence_oper ADD FOREIGN KEY (tufNpdidTuf) REFERENCES tuf_petreg_licence(tufNpdidTuf);
ALTER TABLE tuf_petreg_licence_oper ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE wellbore_shallow_all ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE licence_licensee_hst ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE licence_licensee_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE field_description ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE bsns_arr_area_transfer_hst ADD FOREIGN KEY (baaNpdidBsnsArrArea) REFERENCES bsns_arr_area(baaNpdidBsnsArrArea);
ALTER TABLE bsns_arr_area_transfer_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE facility_moveable ADD FOREIGN KEY (fclNpdidCurrentRespCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE licence_transfer_hst ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE licence_transfer_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE wellbore_document ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE field_reserves ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE wellbore_exploration_all ADD FOREIGN KEY (wlbDrillingOperator) REFERENCES company(cmpLongName);
ALTER TABLE wellbore_exploration_all ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE wellbore_exploration_all ADD FOREIGN KEY (dscNpdidDiscovery) REFERENCES discovery(dscNpdidDiscovery);
ALTER TABLE wellbore_exploration_all ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE wellbore_exploration_all ADD FOREIGN KEY (wlbNpdidWellboreReclass) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE wellbore_exploration_all ADD FOREIGN KEY (prlNpdidProductionLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE field_licensee_hst ADD FOREIGN KEY (fldNpdidField) REFERENCES field(fldNpdidField);
ALTER TABLE field_licensee_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE licence_petreg_licence ADD FOREIGN KEY (prlNpdidLicence) REFERENCES licence(prlNpdidLicence);
ALTER TABLE wellbore_mud ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);
ALTER TABLE tuf_operator_hst ADD FOREIGN KEY (tufNpdidTuf) REFERENCES tuf_petreg_licence(tufNpdidTuf);
ALTER TABLE tuf_operator_hst ADD FOREIGN KEY (cmpNpdidCompany) REFERENCES company(cmpNpdidCompany);
ALTER TABLE wellbore_coordinates ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);

-- Post

SET FOREIGN_KEY_CHECKS = 1;

-- End
ANALYZE TABLE discovery_reserves;
ANALYZE TABLE wellbore_core;
ANALYZE TABLE field_investment_yearly;
ANALYZE TABLE field_production_totalt_NCS_year;
ANALYZE TABLE company_reserves;
ANALYZE TABLE wellbore_formation_top;
ANALYZE TABLE strat_litho_wellbore;
ANALYZE TABLE tuf_owner_hst;
ANALYZE TABLE apaAreaGross;
ANALYZE TABLE fldArea;
ANALYZE TABLE field_owner_hst;
ANALYZE TABLE wlbPoint;
ANALYZE TABLE prlAreaSplitByBlock;
ANALYZE TABLE tuf_petreg_licence_licencee;
ANALYZE TABLE discovery;
ANALYZE TABLE bsns_arr_area_licensee_hst;
ANALYZE TABLE wellbore_dst;
ANALYZE TABLE wellbore_npdid_overview;
ANALYZE TABLE wellbore_oil_sample;
ANALYZE TABLE licence;
ANALYZE TABLE seaArea;
ANALYZE TABLE wellbore_development_all;
ANALYZE TABLE licence_petreg_message;
ANALYZE TABLE fclPoint;
ANALYZE TABLE field_operator_hst;
ANALYZE TABLE licence_petreg_licence_licencee;
ANALYZE TABLE seis_acquisition_coordinates_inc_turnarea;
ANALYZE TABLE field_production_yearly;
ANALYZE TABLE pipLine;
ANALYZE TABLE dscArea;
ANALYZE TABLE licence_task;
ANALYZE TABLE licence_oper_hst;
ANALYZE TABLE licence_phase_hst;
ANALYZE TABLE wellbore_core_photo;
ANALYZE TABLE baaArea;
ANALYZE TABLE bsns_arr_area_area_poly_hst;
ANALYZE TABLE field_activity_status_hst;
ANALYZE TABLE bsns_arr_area;
ANALYZE TABLE bsns_arr_area_operator;
ANALYZE TABLE tuf_petreg_message;
ANALYZE TABLE wellbore_casing_and_lot;
ANALYZE TABLE field;
ANALYZE TABLE strat_litho_wellbore_core;
ANALYZE TABLE seis_acquisition;
ANALYZE TABLE tuf_petreg_licence;
ANALYZE TABLE licence_area_poly_hst;
ANALYZE TABLE seaMultiline;
ANALYZE TABLE licence_petreg_licence_oper;
ANALYZE TABLE prlArea;
ANALYZE TABLE seis_acquisition_progress;
ANALYZE TABLE tuf_petreg_licence_oper;
ANALYZE TABLE wellbore_shallow_all;
ANALYZE TABLE licence_licensee_hst;
ANALYZE TABLE field_description;
ANALYZE TABLE facility_fixed;
ANALYZE TABLE field_production_monthly;
ANALYZE TABLE bsns_arr_area_transfer_hst;
ANALYZE TABLE field_production_totalt_NCS_month;
ANALYZE TABLE facility_moveable;
ANALYZE TABLE licence_transfer_hst;
ANALYZE TABLE wellbore_document;
ANALYZE TABLE company;
ANALYZE TABLE apaAreaNet;
ANALYZE TABLE field_reserves;
ANALYZE TABLE wellbore_exploration_all;
ANALYZE TABLE field_licensee_hst;
ANALYZE TABLE licence_petreg_licence;
ANALYZE TABLE wellbore_mud;
ANALYZE TABLE tuf_operator_hst;
ANALYZE TABLE wellbore_coordinates;
