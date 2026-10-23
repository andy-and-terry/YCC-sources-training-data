# Usage: awk -f day_of_year.awk  (computes day number within the year)
function is_leap(y) { return (y % 4 == 0 && y % 100 != 0) || y % 400 == 0 }

function day_of_year(y, m, d,    i, total, days) {
    split("31 28 31 30 31 30 31 31 30 31 30 31", days, " ")
    if (is_leap(y)) days[2] = 29
    total = d
    for (i = 1; i < m; i++) total += days[i]
    return total
}

BEGIN {
    print "2024-03-01 -> " day_of_year(2024, 3, 1)
    print "2023-03-01 -> " day_of_year(2023, 3, 1)
    print "2023-12-31 -> " day_of_year(2023, 12, 31)
}
