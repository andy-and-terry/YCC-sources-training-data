function Test-Op($n) {
    try {
        if ($n -eq 0) { throw [System.DivideByZeroException]::new('zero') }
        if ($n -lt 0) { throw [System.ArgumentException]::new('negative') }
        "ok $n"
    }
    catch [System.DivideByZeroException] { "div: $($_.Exception.Message)" }
    catch [System.ArgumentException] { "arg: $($_.Exception.Message)" }
    finally { Write-Host "done $n" }
}
0, -1, 4 | ForEach-Object { Test-Op $_ }
