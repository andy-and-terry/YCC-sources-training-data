#!/usr/bin/awk -f
# OFMT formats numbers sent to print; CONVFMT formats numbers
# converted to strings (concatenation, array subscripts).
BEGIN {
    x = 3.14159265
    print x                 # 3.14159 (default %.6g)

    OFMT = "%.2f"
    print x                 # 3.14
    print 17, 17.0          # integral values ignore OFMT: 17 17

    s = x ""
    print s                 # 3.14159 (CONVFMT still %.6g)

    CONVFMT = "%.3f"
    s = x ""
    print s                 # 3.142
}
