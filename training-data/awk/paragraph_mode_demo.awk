#!/usr/bin/awk -f
# With RS="" awk treats each blank-line-separated block of input as one
# record ("paragraph mode"), and splits that record into fields on
# embedded newlines as well as blanks.
BEGIN { RS = "" }
{
    print "Paragraph " NR ": " NF " fields"
}
