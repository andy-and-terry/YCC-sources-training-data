# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
[long]$r = 0
foreach ($n in 1..8) {
    $r = $r * 10 + 1
    $note = if ($r % 3 -eq 0) { '  (divisible by 3)' } else { '' }
    "$r$note"
}
