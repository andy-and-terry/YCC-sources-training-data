BEGIN { split("apple:3:0.5 kiwi:12:0.25", rows, " ")
        for (i in rows) { split(rows[i], f, ":"); printf "%-8s %3d %6.2f\n", f[1], f[2], f[2]*f[3] } }
