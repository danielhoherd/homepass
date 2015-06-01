#!/usr/local/bin/python3

"""
Tidies up the csv syntax and de-dupes mac,ssid pairs.
"""

print('This does not work yet.')

import csv
import sqlite3
import argparse

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('-i', metavar='infile', help="input csv file", default="maclist.csv")
parser.add_argument('-o', metavar='outfile', help="output csv file", default="maclist-new.csv")
parser.add_argument('-d', metavar='database', help="temp database file", default=":memory:")
args = parser.parse_args()

db = sqlite3.connect(args.d)

with open('homepass.sql') as f:
    sql = f.read()

db.executescript(sql)

print("{} {}".format(args.i, args.o))

with open(args.i) as input, open(args.o) as output:
    cr = csv.reader(input)
    for row in cr:
        db.execute("insert into aps (mac,ssid,lat,lon) values(?,?,?,?",row[:4])
