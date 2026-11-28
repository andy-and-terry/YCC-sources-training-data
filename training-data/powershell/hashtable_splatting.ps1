$params = @{
    Path        = '.'
    Filter      = '*.ps1'
    Recurse     = $true
    ErrorAction = 'SilentlyContinue'
}
Get-ChildItem @params | Select-Object -First 3 Name
