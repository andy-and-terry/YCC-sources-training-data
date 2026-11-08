$f = { param($x) $x * $x - 2 }
$a = 1.0; $b = 2.0
for ($i = 0; $i -lt 40; $i++) {
    $fa = & $f $a; $fb = & $f $b
    if ($fa -eq $fb) { break }
    $c = $b - $fb * ($b - $a) / ($fb - $fa)
    $a = $b; $b = $c
}
'{0:N8}' -f $b
