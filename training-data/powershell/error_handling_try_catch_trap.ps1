function Risky([int]$n) {
    if ($n -lt 0) { throw [System.ArgumentException]::new('negative') }
    if ($n -eq 0) { Write-Error 'zero given' -ErrorAction Stop }
    1 / $n
}
foreach ($v in 5, -1, 0) {
    try { Risky $v }
    catch [System.ArgumentException] { "arg: $($_.Exception.Message)" }
    catch { "other: $($_.Exception.Message)" }
    finally { "checked $v" }
}
try { 1 / 0 } catch [System.DivideByZeroException] { 'div by zero' }
try { [int]'abc' } catch { 'cast failed: ' + $_.Exception.GetType().Name }
$ErrorActionPreference = 'Stop'
try { Get-Item '/nonexistent/path' } catch { 'item not found' }
$ErrorActionPreference = 'Continue'
Get-Item '/nonexistent' -ErrorAction SilentlyContinue
$Error.Count -gt 0
trap { 'trapped: ' + $_.Exception.Message; continue }
throw 'trap me'
'after trap'
