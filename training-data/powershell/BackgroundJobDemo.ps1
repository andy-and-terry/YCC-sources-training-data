$jobs = 1..3 | ForEach-Object {
    Start-Job -Name "worker$_" -ArgumentList $_ -ScriptBlock {
        param($n)
        Start-Sleep -Milliseconds (100 * (4 - $n))
        [pscustomobject]@{ Worker = $n; Square = $n * $n }
    }
}

"Started: $($jobs.Name -join ', ')"

$null = Wait-Job -Job $jobs -Timeout 30
$jobs | ForEach-Object { "$($_.Name): $($_.State)" }

$results = $jobs | Receive-Job
$results | Sort-Object Worker | ForEach-Object { "worker $($_.Worker) -> $($_.Square)" }

$failing = Start-Job { throw "job failed" }
$null = Wait-Job $failing
"Failing job state: $($failing.State)"
$null = Receive-Job $failing -ErrorAction SilentlyContinue -ErrorVariable jobError
"Error message: $($jobError[0].Exception.Message)"

$jobs + $failing | Remove-Job -Force
"Remaining jobs: $((Get-Job).Count)"
