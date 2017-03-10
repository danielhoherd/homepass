#!/usr/bin/env python3
# HeadURL: https://github.com/danielhoherd/homepass/blob/master/csv-to-kml.py

"""
Takes a csv file formatted as mac,ssid,lat,lon and creates a KML for all relevant entries.
"""

import argparse
import csv
import simplekml
kml = simplekml.Kml()

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('-f', metavar='filename', help="csv file", default="maclist.csv")
args = parser.parse_args()

with open(args.f) as input:
    cr = csv.reader(input)
    for row in cr:
        try:
            if (row[3]) and (float(row[3]) != 0):
                ap = "{}-{}".format(row[1],row[0])
                kml.newpoint(name=ap, coords=[(row[3],row[2])])
        except ValueError:
            pass

kml.save("maclist.kml")
