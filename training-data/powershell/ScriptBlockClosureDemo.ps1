function New-Counter {
    param([int]$Start = 0)
    $count = $Start
    return {
        $script:count = $count
        $count++
        return $script:count
    }.GetNewClosure()
}

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
