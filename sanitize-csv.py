#!/usr/local/bin/python3

"""
Tidy's up the csv syntax and de-dupes mac,ssid pairs.
"""

import csv
import sqlite3
import argparse

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('-i', metavar='input filename', help="input csv file", default="maclist.csv")
parser.add_argument('-o', metavar='output filename', help="output csv file", default="maclist-new.csv")
args = parser.parse_args()

# db = sqlite3.connect(':memory:')
db = sqlite3.connect('foo.db')

with open('homepass.sql') as f:
    sql = f.read()

db.executescript(sql)

print("{} {}".format(args.i, args.o))

with open(args.i) as input, open(args.o) as output:
    cr = csv.reader(input)
    for row in cr:
        db.execute("insert into aps (mac,ssid,lat,lon) values(?,?,?,?",row)
