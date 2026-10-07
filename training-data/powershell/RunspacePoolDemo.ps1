$pool = [runspacefactory]::CreateRunspacePool(1, 4)
$pool.Open()

$work = 1..6 | ForEach-Object {
    $ps = [powershell]::Create()
    $ps.RunspacePool = $pool
    [void]$ps.AddScript({ param($n) $n * 10 }).AddArgument($_)
    [pscustomobject]@{ Shell = $ps; Handle = $ps.BeginInvoke() }
}

$results = foreach ($w in $work) {
    $w.Shell.EndInvoke($w.Handle)
    $w.Shell.Dispose()
}

$pool.Close()
"Results: $($results -join ', ')"
