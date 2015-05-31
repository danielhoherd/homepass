#!/usr/local/bin/python3
# HeadURL: https://github.com/danielhoherd/homepass/blob/master/csv-to-kml.py

"""
Takes a csv file formatted as mac,ssid,lat,lon and creates a KML for all relevant entries.
"""

import csv
import simplekml
kml = simplekml.Kml()

with open('maclist.csv') as input:
    cr = csv.reader(input)
    next(cr, None) # skip header
    for row in cr:
        if (row[3]) and (float(row[3]) != 0):
            print(row)
            ap = "{}-{}".format(row[1],row[0])
            kml.newpoint(name=ap, coords=[(row[3],row[2])])

kml.save("maclist.kml")