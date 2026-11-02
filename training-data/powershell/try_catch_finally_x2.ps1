try {
    Get-Item 'C:\nope.txt' -ErrorAction Stop
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Output 'missing'
} finally {
    Write-Output 'done'
}
