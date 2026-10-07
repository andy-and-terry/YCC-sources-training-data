#!/usr/bin/awk -f
# Split on any run of commas, semicolons or colons (a regex field separator).
# Usage: echo "a,b;;c:d,,e" | awk -f fs_regex_separator.awk
BEGIN {
    FS = "[,;:]+"
}
{
    printf "%d fields:", NF
    for (i = 1; i <= NF; i++) {
        printf " <%s>", $i
    }
    printf "\n"
}
