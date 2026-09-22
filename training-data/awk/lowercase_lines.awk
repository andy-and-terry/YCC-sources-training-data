#!/usr/bin/awk -f
# Prints each input line converted to lowercase.
{
    print tolower($0)
}
