function Get-Duval([string]$s) {
    $out = @(); $i = 0; $n = $s.Length
    while ($i -lt $n) {
        $j = $i + 1; $k = $i
        while ($j -lt $n -and $s[$k] -le $s[$j]) {
            if ($s[$k] -lt $s[$j]) { $k = $i } else { $k++ }
            $j++
        }
        while ($i -le $k) { $out += $s.Substring($i, $j - $k); $i += $j - $k }
    }
    $out
}
(Get-Duval 'banana') -join ' '
