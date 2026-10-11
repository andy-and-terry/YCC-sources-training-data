#!/usr/bin/awk -f
# Parse fixed-width columns with substr
BEGIN {
    rec = "Alice     30NYC   "
    name = substr(rec, 1, 10)
    age = substr(rec, 11, 2) + 0
    city = substr(rec, 13, 6)
    gsub(/[ ]+$/, "", name); gsub(/[ ]+$/, "", city)
    printf "name=[%s] age=%d city=[%s]\n", name, age, city
}
