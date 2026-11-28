BEGIN {
    for (y = -1.0; y <= 1.0; y += 0.2) {
        line = ""
        for (x = -2.0; x <= 0.6; x += 0.05) {
            zr = 0; zi = 0; n = 0
            while (n < 30 && zr * zr + zi * zi < 4) {
                t = zr * zr - zi * zi + x
                zi = 2 * zr * zi + y
                zr = t; n++
            }
            line = line (n == 30 ? "#" : ".")
        }
        print line
    }
}
