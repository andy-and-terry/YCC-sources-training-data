#!/usr/bin/awk -f
# Prints each input line converted to uppercase.
{
    print toupper($0)
}
