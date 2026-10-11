$n = 1
do {
    "do-while: $n"
    $n *= 3
} while ($n -lt 30)

$count = 0
do {
    $count++
} until ($count * $count -gt 50)
"smallest count with count^2 > 50: $count"

$i = 10
while ($i -gt 0) {
    if ($i % 4 -eq 0) { "multiple of 4: $i" }
    $i -= 3
}

do { 'runs once even though condition is false' } while ($false)
