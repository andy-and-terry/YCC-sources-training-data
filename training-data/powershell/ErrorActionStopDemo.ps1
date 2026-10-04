function Read-Number {
    param([string]$Text)
    try {
        [int]::Parse($Text)
    }
    catch [System.FormatException] {
        Write-Output "format error for '$Text'"
    }
    finally {
        Write-Output "checked '$Text'"
    }
}

Read-Number "42"
Read-Number "4x2"

try {
    Get-Item -Path "/no/such/path" -ErrorAction Stop
}
catch {
    "caught: $($_.CategoryInfo.Category)"
}

$result = Get-Item -Path "/no/such/path" -ErrorAction SilentlyContinue
"silent result is null: $($null -eq $result)"

try {
    throw [System.InvalidOperationException]::new("custom failure")
}
catch [System.InvalidOperationException] {
    "invalid operation: $($_.Exception.Message)"
}
