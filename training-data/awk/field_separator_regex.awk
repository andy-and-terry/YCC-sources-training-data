#!/usr/bin/awk -f
# Uses a regex field separator: splits on commas, semicolons or pipes with optional spaces.
BEGIN { FS = "[ ]*[,;|][ ]*" }
{
    printf "%d fields:", NF
    for (i = 1; i <= NF; i++) printf " [%s]", $i
    printf "\n"
}
