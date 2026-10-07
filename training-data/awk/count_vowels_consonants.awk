#!/usr/bin/awk -f
# Counts vowels, consonants, and digits in each input line.
{
    vowels = 0
    consonants = 0
    digits = 0
    line = tolower($0)
    n = length(line)
    for (i = 1; i <= n; i++) {
        c = substr(line, i, 1)
        if (c ~ /[aeiou]/) vowels++
        else if (c ~ /[a-z]/) consonants++
        else if (c ~ /[0-9]/) digits++
    }
    print "vowels:", vowels, "consonants:", consonants, "digits:", digits
}
