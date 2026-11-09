$obj = [pscustomobject]@{ name = "Ann"; tags = @("a", "b") }
$json = $obj | ConvertTo-Json -Compress
$json
($json | ConvertFrom-Json).tags.Count
