#!/usr/bin/awk -f
BEGIN {
    for (i = 1; i <= 10; i++) sum += i * i
    print sum
}
