$name = "World"
$text = @"
Hello, $name!
Sum: $(1 + 2)
"@
$text

$raw = @'
No $interpolation here.
Backslashes \n stay literal.
'@
$raw

($text -split "`n").Count
