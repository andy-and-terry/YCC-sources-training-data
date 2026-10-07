$missing = Join-Path ([System.IO.Path]::GetTempPath()) "definitely-missing-file.txt"

# default: non-terminating error is reported but execution continues
Get-Item $missing -ErrorAction SilentlyContinue
"after silent failure"

# capture the error without displaying it
Get-Item $missing -ErrorAction SilentlyContinue -ErrorVariable problem
"captured: $($problem[0].CategoryInfo.Category)"

# turn non-terminating errors into terminating ones
try {
    Get-Item $missing -ErrorAction Stop
} catch [System.Management.Automation.ItemNotFoundException] {
    "specific catch: item not found"
} finally {
    "cleanup ran"
}

# $ErrorActionPreference applies to the whole scope
$ErrorActionPreference = "Stop"
try {
    1 / 0
} catch {
    "caught: $($_.Exception.GetType().Name)"
}
$ErrorActionPreference = "Continue"

function Test-Trap {
    trap { "trap handled: $($_.Exception.Message)"; continue }
    throw "something broke"
    "not reached"
}
Test-Trap
"errors recorded in `$Error: $($Error.Count -gt 0)"
