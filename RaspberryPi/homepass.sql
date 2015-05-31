PRAGMA foreign_keys=OFF;
CREATE TABLE aps(
    mac text NOT NULL,
    ssid text NOT NULL,
    lat text,
    lon text,
    last_used text,
    PRIMARY KEY (mac,  ssid)
);
.mode csv
.import ../maclist.csv aps
