PRAGMA foreign_keys=OFF;
CREATE TABLE aps(
    mac text NOT NULL,
    ssid text NOT NULL,
    lat text,
    lon text,
    last_used text,
    PRIMARY KEY (mac,  ssid)
);
-- The following will not add fields that do not exist for existing mac,ssid pairs
.mode csv
.import ../maclist.csv aps
