# Tee-Object copies pipeline output to a variable or file while passing it on.

$numbers = 1..10

# Capture the filtered values in a variable mid-pipeline
$total = $numbers |
    Where-Object { $_ % 2 -eq 0 } |
    Tee-Object -Variable evens |
    Measure-Object -Sum

Write-Host "Evens captured: $($evens -join ', ')"
Write-Host "Sum of evens:   $($total.Sum)"

# Write to a file and keep processing
$path = Join-Path ([System.IO.Path]::GetTempPath()) 'tee-demo.txt'
$squares = $numbers |
    ForEach-Object { $_ * $_ } |
    Tee-Object -FilePath $path |
    Where-Object { $_ -gt 20 }

Write-Host "Squares over 20: $($squares -join ', ')"
Write-Host "File contents:   $((Get-Content $path) -join ', ')"

# Append mode keeps earlier content
'extra' | Tee-Object -FilePath $path -Append | Out-Null
Write-Host "Line count after append: $((Get-Content $path).Count)"

Remove-Item $path
