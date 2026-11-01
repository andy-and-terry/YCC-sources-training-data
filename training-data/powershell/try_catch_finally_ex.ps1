try {
    $n = [int]'abc'
} catch [System.Management.Automation.RuntimeException] {
    Write-Host "bad cast: $($_.Exception.Message)"
} finally {
    Write-Host 'done'
}
try { Get-Item /does/not/exist -ErrorAction Stop } catch { Write-Host "caught: $($_.CategoryInfo.Category)" }
