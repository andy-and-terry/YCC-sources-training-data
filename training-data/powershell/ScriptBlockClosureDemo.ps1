function New-Counter {
    param([int]$Start = 0)
    $count = $Start
    return {
        $count++
        return $count
    }.GetNewClosure()
}

# Each call to New-Counter captures its own independent $count via
# GetNewClosure(), so the two counters below do not share state even
# though they were built from the same script block.
$counterA = New-Counter -Start 10
$counterB = New-Counter -Start 100

& $counterA
& $counterA
& $counterB
& $counterA

function New-Multiplier {
    param([int]$Factor)
    return { param([int]$x) $x * $Factor }.GetNewClosure()
}

$triple = New-Multiplier -Factor 3
& $triple 7
