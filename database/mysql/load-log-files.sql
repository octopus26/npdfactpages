CREATE TABLE  wellbore_log_overview (
	logFileName VARCHAR(200) NOT NULL COMMENT "file name of wellbore log files",
    wlbWellboreName VARCHAR(40) NOT NULL COMMENT "wlbWellboreName",
    logFileId INTEGER NOT NULL COMMENT "index of log files",
    wlbNpdidWellbore INTEGER NOT NULL COMMENT "wlbNpdidWellbore",
    PRIMARY KEY (logFileId)
);

LOAD DATA LOCAL INFILE 'C:/Users/YZhang147/Documents/Git/sdr-npd/npd-2016-logs-parse/wellbore_log_overview_with_npdid.csv'
INTO TABLE wellbore_log_overview
COLUMNS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

ALTER TABLE wellbore_log_overview ADD FOREIGN KEY (wlbNpdidWellbore) REFERENCES wellbore_npdid_overview(wlbNpdidWellbore);



