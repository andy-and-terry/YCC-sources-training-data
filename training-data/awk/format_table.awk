#!/usr/bin/awk -f
# Pretty-prints a fixed name/score table with padded, aligned columns.
BEGIN {
    name[1] = "Alice"; score[1] = 92
    name[2] = "Bob";   score[2] = 78
    name[3] = "Carol"; score[3] = 85

    printf "%-10s %5s\n", "Name", "Score"
    for (i = 1; i <= 3; i++) {
        printf "%-10s %5d\n", name[i], score[i]
    }
}
