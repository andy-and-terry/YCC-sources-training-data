$obj = @{ name = 'ann'; tags = @('a', 'b'); nested = @{ n = 1 } }
$json = $obj | ConvertTo-Json -Depth 3 -Compress
$json
$back = $json | ConvertFrom-Json
$back.nested.n
$back.tags.Count
