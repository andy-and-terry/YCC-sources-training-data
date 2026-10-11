#!/usr/bin/awk -f
# Count word bigrams
{
    for (i = 1; i < NF; i++) bi[tolower($i) " " tolower($(i+1))]++
}
END { for (b in bi) if (bi[b] > 1) print bi[b], b }
