PRAGMA foreign_keys=OFF;
CREATE TABLE aps(
    mac text NOT NULL,
    ssid text NOT NULL,
    last_used text,
    PRIMARY KEY (mac,  ssid)
);
