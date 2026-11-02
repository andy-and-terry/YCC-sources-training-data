$params = @{ Path = '.'; Filter = '*.ps1'; Recurse = $true }
Get-ChildItem @params | Measure-Object | Select-Object -ExpandProperty Count
