# Null-coalescing operators require PowerShell 7+
$name = $null
$display = $name ?? 'anonymous'
$display

$config = @{ Timeout = $null }
$config.Timeout ??= 30
$config.Retries ??= 3
$config.GetEnumerator() | Sort-Object Name | ForEach-Object { "$($_.Name)=$($_.Value)" }

$user = $null
$user?.Name
$list = @(1, 2, 3)
$list?[1]
