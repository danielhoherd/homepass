#!/usr/bin/env bash
about="${0#**/} - Show some stats about the homepass db

Prints out the following columns:
# 1) Line number of the printed report
# 2) Date that is being reported about
# 3) Number of APs that were last used on date from column 2
# 4) A graph showing 1:10 ratio of column 3 data
"

DB=/root/homepass.db

if [ $# -gt 0 ] ; then
  echo "$about"
  exit 0
fi

if [ ! -f "${DB}" ] || [ ! -r "${DB}" ] ; then
  date "+%F %T%z ERROR: ${DB} is not readable!"
  exit 1
fi

sqlite3 "${DB}" "select last_used from aps order by last_used asc ;" |
  awk '{print $1}' |
  sort |
  uniq -c |
  while read -r c d ; do
    o=$(printf "%-$(( c / 10 + 1 ))s" "=") ;
    echo "$d $c ${o// /=}" ;
  done |
  sort |
  nl -ba |
  column -t
