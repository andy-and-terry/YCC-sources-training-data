$scores = 72, 85, 91, 66, 85, 78, 99, 85

$stats = $scores | Measure-Object -Sum -Average -Minimum -Maximum
"Count:   $($stats.Count)"
"Sum:     $($stats.Sum)"
"Average: $([math]::Round($stats.Average, 2))"
"Min/Max: $($stats.Minimum)/$($stats.Maximum)"

# median and standard deviation by hand
$sorted = $scores | Sort-Object
$mid = [int]($sorted.Count / 2)
$median = if ($sorted.Count % 2) { $sorted[$mid] } else { ($sorted[$mid - 1] + $sorted[$mid]) / 2 }
"Median:  $median"

$variance = ($scores | ForEach-Object { [math]::Pow($_ - $stats.Average, 2) } | Measure-Object -Average).Average
"StdDev:  $([math]::Round([math]::Sqrt($variance), 2))"

# mode via Group-Object
$mode = $scores | Group-Object | Sort-Object Count -Descending | Select-Object -First 1
"Mode:    $($mode.Name) (x$($mode.Count))"

# measuring text
$text = "the quick brown fox jumps over the lazy dog"
$text | Measure-Object -Word -Character | Select-Object Words, Characters

# measure a property of objects
$items = @(
    [pscustomobject]@{ Name = "a"; Size = 10 }
    [pscustomobject]@{ Name = "b"; Size = 25 }
)
($items | Measure-Object Size -Sum).Sum
