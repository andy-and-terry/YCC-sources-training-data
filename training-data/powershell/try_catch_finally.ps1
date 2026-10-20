try {
    [int]$n = 'abc'
} catch [System.Management.Automation.ArgumentTransformationMetadataException] {
    Write-Host "bad cast: $($_.Exception.Message)"
} finally {
    Write-Host 'done'
}
