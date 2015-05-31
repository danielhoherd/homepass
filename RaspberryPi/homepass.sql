PRAGMA foreign_keys=OFF;
CREATE TABLE aps(
    mac text NOT NULL,
    ssid text NOT NULL,
    lat text,
    lon text,
    last_used text,
    PRIMARY KEY (mac,  ssid)
);
-- The following will not import any fields for mac,ssid pairs that already exist in the db
.mode csv
.import ../maclist.csv aps
