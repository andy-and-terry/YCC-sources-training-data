#!/usr/bin/awk -f
# Assigns each row a rank (1 = largest) based on its first numeric column.
{
    lines[NR] = $0
    values[NR] = $1
}
END {
    for (i = 1; i <= NR; i++) {
        rank = 1
        for (j = 1; j <= NR; j++) {
            if (values[j] > values[i]) rank++
        }
        print rank, lines[i]
    }
}
