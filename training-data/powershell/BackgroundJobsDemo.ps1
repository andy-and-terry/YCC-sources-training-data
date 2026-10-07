$jobs = 1..3 | ForEach-Object {
    Start-Job -Name "Square$_" -ScriptBlock {
        param($n)
        Start-Sleep -Milliseconds (100 * $n)
        [pscustomobject]@{ Input = $n; Square = $n * $n }
    } -ArgumentList $_
}

$jobs | Wait-Job | Out-Null
$jobs | Receive-Job | Sort-Object Input | Format-Table -AutoSize
$jobs | ForEach-Object { "{0}: {1}" -f $_.Name, $_.State }
$jobs | Remove-Job
