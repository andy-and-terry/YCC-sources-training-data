#!/usr/bin/awk -f
{
    total += NF
}
END {
    print "words:", total + 0
}
