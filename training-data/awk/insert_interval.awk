# Input lines: "lo hi"; the NEW interval is passed with -v lo=2 -v hi=5 (lines must be sorted).
BEGIN { placed = 0 }
{
    if ($2 < lo) print $1, $2
    else if ($1 > hi) {
        if (!placed) { print lo, hi; placed = 1 }
        print $1, $2
    } else {
        if ($1 < lo) lo = $1
        if ($2 > hi) hi = $2
    }
}
END { if (!placed) print lo, hi }
