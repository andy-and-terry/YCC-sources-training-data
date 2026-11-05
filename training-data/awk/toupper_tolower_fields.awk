#!/usr/bin/awk -f
BEGIN {
    s = "Hello World"
    print toupper(s)
    print tolower(s)
    print length(s)
}
