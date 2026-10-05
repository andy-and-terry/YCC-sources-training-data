function Get-CollatzSteps {
    param([long]$Start)
    $n = $Start
    $steps = 0
    while ($n -ne 1) {
        if ($n % 2 -eq 0) { $n = $n / 2 } else { $n = 3 * $n + 1 }
        $steps++
    }
    $steps
}

"27 takes $(Get-CollatzSteps -Start 27) steps"
$best = 1; $bestSteps = 0
foreach ($i in 1..1000) {
    $s = Get-CollatzSteps -Start $i
    if ($s -gt $bestSteps) { $best = $i; $bestSteps = $s }
}
"Longest under 1000: $best ($bestSteps steps)"
