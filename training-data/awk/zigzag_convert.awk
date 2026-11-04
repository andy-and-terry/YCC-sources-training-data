# usage: awk -f zigzag_convert.awk   (reads "STRING ROWS" lines)
function zigzag(s, rows,    n, lines, r, step, i, out) {
    n = length(s)
    if (rows == 1 || rows >= n) return s
    r = 1; step = 1
    for (i = 1; i <= n; i++) {
        lines[r] = lines[r] substr(s, i, 1)
        if (r == 1) step = 1
        else if (r == rows) step = -1
        r += step
    }
    for (i = 1; i <= rows; i++) out = out lines[i]
    return out
}

BEGIN { print zigzag("PAYPALISHIRING", 3) }
