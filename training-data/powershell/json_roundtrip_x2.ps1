$obj = @{ name = 'ann'; tags = @('a', 'b') }
$json = $obj | ConvertTo-Json -Compress
($json | ConvertFrom-Json).tags.Count
