$params = @{
    Path = "."
    Filter = "*.txt"
    Recurse = $true
}
Get-ChildItem @params | Select-Object -First 3 FullName
