$path = Join-Path ([System.IO.Path]::GetTempPath()) 'clixml_demo.xml'

$data = [PSCustomObject]@{
    Name  = 'server01'
    Ports = @(80, 443, 8080)
    Tags  = @{ Env = 'prod'; Team = 'ops' }
    Date  = [datetime]'2024-03-15'
}

$data | Export-Clixml -Path $path
Test-Path $path

$restored = Import-Clixml -Path $path
$restored.Name
$restored.Ports -join ','
$restored.Tags['Env']
$restored.Date.ToString('yyyy-MM-dd')
$restored.Ports.GetType().Name

Remove-Item $path
