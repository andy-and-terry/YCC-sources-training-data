try {
    Get-Item 'C:\does\not\exist' -ErrorAction Stop
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "missing: $($_.Exception.Message)"
} finally {
    Write-Host 'done'
}
