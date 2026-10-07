:outer foreach ($row in 1..5) {
    foreach ($col in 1..5) {
        if ($col -gt $row) { continue outer }
        if ($row * $col -eq 12) {
            "found 12 at row $row, col $col"
            break outer
        }
    }
}

$i = 0
while ($true) {
    $i++
    if ($i % 2 -eq 0) { continue }
    if ($i -gt 7) { break }
    "odd: $i"
}

do {
    $i--
} until ($i -le 5)
"countdown stopped at $i"
