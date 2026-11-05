$o = [pscustomobject]@{ name = 'ann'; tags = @('a', 'b'); nested = @{ k = 1 } }
$json = $o | ConvertTo-Json -Compress
$json
($json | ConvertFrom-Json).tags.Count
