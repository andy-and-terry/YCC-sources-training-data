#!/usr/bin/awk -f
# Prints FizzBuzz for 1 to 20: Fizz for multiples of 3, Buzz for 5, FizzBuzz for both.
BEGIN {
    for (i = 1; i <= 20; i++) {
        if (i % 15 == 0) print "FizzBuzz"
        else if (i % 3 == 0) print "Fizz"
        else if (i % 5 == 0) print "Buzz"
        else print i
    }
}
