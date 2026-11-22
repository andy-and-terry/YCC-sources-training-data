# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
$row = @([long]1)
$out = @([long]1)
1..9 | ForEach-Object {
    $next = @([long]0)
    for ($j = $row.Count - 1; $j -ge 0; $j--) { $next += $next[-1] + $row[$j] }
    $row = $next
    $out += $row[-1]
}
$out -join ' '
