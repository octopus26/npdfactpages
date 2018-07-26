CREATE TABLE  wellbore_log_header (
	recordId INTEGER NOT NULL COMMENT "record id",
	section VARCHAR(40) NOT NULL COMMENT "sections of the log header",
    mnemonic VARCHAR(40) NOT NULL COMMENT "mnemonic",
    unit VARCHAR(20) NOT NULL COMMENT "unit",
    val VARCHAR(400) NOT NULL COMMENT "value",
    description VARCHAR(400) NOT NULL COMMENT "description",
    logFileId INTEGER NOT NULL COMMENT "logFileId",
    PRIMARY KEY (recordId),
    FOREIGN KEY (logFileId) REFERENCES wellbore_log_overview(logFileId)
);

LOAD DATA LOCAL INFILE 'C:/Users/YZhang147/Documents/Git/sdr-npd/npd-2016-logs-parse/wellbore_log_header_with_recordId_remove_no.csv'
INTO TABLE wellbore_log_header
COLUMNS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
