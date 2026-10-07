"[int]'42' + 1       = $([int]'42' + 1)"
"[double]'3.5' * 2   = $([double]'3.5' * 2)"
"[int]3.7            = $([int]3.7)"
"[int]2.5            = $([int]2.5)"
"[string]123         = '$([string]123)'"
"[bool]''            = $([bool]'')"
"[bool]'false'       = $([bool]'false')"
"[char]65            = $([char]65)"
"[int][char]'a'      = $([int][char]'a')"

$bytes = [byte[]](72, 105)
"bytes to string: $([System.Text.Encoding]::ASCII.GetString($bytes))"

$parsed = $null
if ([int]::TryParse('12a', [ref]$parsed)) { "parsed $parsed" } else { "not an int" }
"type: $((1.5).GetType().Name) $('x'.GetType().Name) $(@(1).GetType().Name)"
"-is test: $(5 -is [int]) $('5' -is [int])"
