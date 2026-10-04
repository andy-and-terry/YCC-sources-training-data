#!/usr/bin/awk -f
# Shows how awk decides between string and numeric comparison.
BEGIN {
    print (10 < 9)            # numeric: 0
    print ("10" < "9")        # string constants: 1
    print ("10" + 0 < "9" + 0) # forced numeric: 0
    print (10 "" < 9 "")      # forced string via concatenation: 1

    x = "abc"
    print (x == 0)            # string vs number compares as strings: 0
    print (y == 0 && y == "") # uninitialized variable is both: 1

    s = "3.0"
    print (s == 3)            # a string constant stays a string: 0
}
{
    # fields that look numeric are compared numerically
    print ($1 < $2 ? $1 " < " $2 : $1 " >= " $2)
}
