function Test-Missing {
    Get-Item -Path 'C:\definitely\missing\file.txt' -ErrorAction SilentlyContinue
    "continued after silent error; errors: $($Error.Count -ge 0)"
}
Test-Missing

try {
    Get-Item -Path '/definitely/missing/file.txt' -ErrorAction Stop
}
catch [System.Management.Automation.ItemNotFoundException] {
    "Not found: $($_.Exception.Message)"
}
finally {
    'cleanup done'
}

$ErrorActionPreference = 'Stop'
try { 1 / 0 } catch { "caught: $($_.Exception.GetType().Name)" }

trap { "trapped: $($_.Exception.Message)"; continue }
throw 'custom failure'
