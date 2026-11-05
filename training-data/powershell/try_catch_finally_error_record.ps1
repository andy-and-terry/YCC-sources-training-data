try {
    $null = Get-Item -Path 'C:\no\such\file' -ErrorAction Stop
}
catch [System.Management.Automation.ItemNotFoundException] {
    Write-Output "not found: $($_.Exception.Message)"
}
finally {
    Write-Output 'done'
}
