$n = 8
foreach ($r in 0..($n - 1)) {
    $line = ' ' * ($n - $r - 1)
    foreach ($c in 0..$r) { $line += if (($r -band $c) -eq $c) { '* ' } else { '  ' } }
    $line
}
