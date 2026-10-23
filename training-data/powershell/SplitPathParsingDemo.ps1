$path = '/var/log/app/server.2024.log'

# Split-Path extracts parts of a path without touching the filesystem
Write-Output ("Parent : " + (Split-Path $path -Parent))
Write-Output ("Leaf   : " + (Split-Path $path -Leaf))

# Base name and extension through the .NET Path class
Write-Output ("Base   : " + [System.IO.Path]::GetFileNameWithoutExtension($path))
Write-Output ("Ext    : " + [System.IO.Path]::GetExtension($path))

# Build and normalise paths with Join-Path
$combined = Join-Path (Join-Path 'root' 'sub') 'file.txt'
Write-Output "Joined : $combined"
Write-Output ("Changed ext: " + [System.IO.Path]::ChangeExtension($combined, '.bak'))

# Process a list of paths into objects
$files = '/a/b/report.pdf', '/a/c/notes.txt', '/a/b/data.csv'
$files | ForEach-Object {
    [PSCustomObject]@{
        Name   = Split-Path $_ -Leaf
        Folder = Split-Path $_ -Parent
        Ext    = [System.IO.Path]::GetExtension($_).TrimStart('.')
    }
} | Sort-Object Folder, Name | Format-Table -AutoSize
