#!/usr/bin/awk -f
BEGIN {
    printf "%-8s|%6s|%8s\n", "name", "qty", "price"
    printf "%-8s|%6d|%8.2f\n", "apple", 3, 1.5
    printf "%-8s|%6d|%8.2f\n", "pear", 12, 0.75
}
