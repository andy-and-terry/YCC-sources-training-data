$scores = @{
    Ada  = 88
    Bob  = 72
    Cleo = 95
}

foreach ($key in $scores.Keys | Sort-Object) {
    Write-Output "$key`: $($scores[$key])"
}

$average = ($scores.Values | Measure-Object -Average).Average
Write-Output "average: $average"
