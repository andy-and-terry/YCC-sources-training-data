$name = 'Ada'
$items = 'tea', 'cake'

$template = @"
Dear $name,
You ordered $($items.Count) items: $($items -join ' and ').
Total: {0:C2}
"@
$template -f 12.5

$literal = @'
No $interpolation here: $name stays as-is.
'@
$literal

$csv = @'
id,name
1,alpha
2,beta
'@ | ConvertFrom-Csv
$csv | ForEach-Object { '{0}:{1}' -f $_.id, $_.name }
