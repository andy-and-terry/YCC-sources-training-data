$log = @'
2024-05-01 INFO  service started
2024-05-01 WARN  disk at 91%
2024-05-02 ERROR connection refused
2024-05-02 INFO  retrying
2024-05-03 ERROR timeout after 30s
'@ -split "`n"

$log | Select-String -Pattern 'ERROR' | ForEach-Object { $_.Line }
($log | Select-String -Pattern 'INFO' -NotMatch).Count
$log | Select-String -Pattern '(\d+)s$' | ForEach-Object { $_.Matches[0].Groups[1].Value }
$log | Select-String -Pattern 'warn' -CaseSensitive
($log | Select-String -SimpleMatch '%').LineNumber
