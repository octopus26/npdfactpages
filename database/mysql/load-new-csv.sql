CREATE TABLE  strat_litho_overview (
	lsuName VARCHAR(20) NOT NULL COMMENT "Lithostrat. unit",
    lsuLevel VARCHAR(9) NOT NULL COMMENT "Level",
    lsuNameParent VARCHAR(20) COMMENT "Lithostrat. unit, parent",
    lsuDescription TEXT NOT NULL,
    lsuFactPageUrl VARCHAR(200) NOT NULL,
    lsuNpdidLithoStrat INTEGER COMMENT "NPDID Lithostrat. unit",
    lsuNpdidLithoStratParent INTEGER COMMENT "NPDID parent lithostrat. unit",
    PRIMARY KEY (lsuNpdidLithoStrat)
);

LOAD DATA LOCAL INFILE 'C:/Users/YZhang147/Documents/Yu_Zhang_2018SDR_intern/npd_data_analysis/strat_litho_overview.csv'
INTO TABLE strat_litho_overview
COLUMNS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

ALTER TABLE strat_litho_wellbore ADD FOREIGN KEY (lsuNpdidLithoStrat) REFERENCES strat_litho_overview(lsuNpdidLithoStrat);
ALTER TABLE strat_litho_wellbore_core ADD FOREIGN KEY (lsuNpdidLithoStrat) REFERENCES strat_litho_overview(lsuNpdidLithoStrat);

