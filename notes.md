# Sqlite3 tricks

- Duplicate `attwifi` as `NZ@McD1` : `insert or replace into aps (mac,ssid) select mac,"NZ@McD1" from aps where ssid = 'attwifi' ;`
