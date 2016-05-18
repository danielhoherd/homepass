-- https://github.com/danielhoherd/homepass/blob/master/homepass.sql

PRAGMA foreign_keys=OFF;
CREATE TABLE aps(
    mac text NOT NULL,
    ssid text NOT NULL,
    lat text,
    lon text,
    last_used text,
    PRIMARY KEY (mac,  ssid)
) IF NOT EXISTS ;

-- The following will not import any fields for mac,ssid pairs that already exist in the db
.mode csv
.import maclist.csv aps
delete from aps where MAC = 'MAC' ;
