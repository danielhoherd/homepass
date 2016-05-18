#!/usr/bin/env bash
set -e
set -x

cd /srv/code/homepass
sqlite3 /srv/homepass/lib/homepass.db < /srv/code/homepass/homepass.sql
