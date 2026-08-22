#!/usr/bin/awk -f
{
    for (i = 1; i <= NF; i++) {
        if (length($i) > length(longest)) longest = $i
    }
}
END {
    print longest
}
