#!/usr/bin/awk -f
# Removes punctuation characters from each input line.
{
    line = $0
    gsub(/[[:punct:]]/, "", line)
    print line
}
