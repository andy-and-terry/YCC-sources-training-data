#!/usr/bin/awk -f
# Reads candidate email addresses from stdin and reports which look valid.
{
    if ($0 ~ /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z][A-Za-z]+$/) {
        print $0 ": valid"
    } else {
        print $0 ": invalid"
    }
}
