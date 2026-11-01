$a = 1..5
$a += 6
$a[-1]
$a[1..3]
($a | Measure-Object -Average -Maximum).Average
$a -contains 3
[array]::Reverse($a); $a -join ' '
$list = [System.Collections.Generic.List[string]]::new(); $list.Add('x'); $list.Count
