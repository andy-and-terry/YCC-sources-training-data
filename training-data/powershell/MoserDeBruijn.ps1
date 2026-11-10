# Read the binary digits of i as base-4 digits.
function Get-MoserDeBruijn([int]$i) {
    $value = 0; $power = 1
    while ($i -gt 0) {
        if ($i -band 1) { $value += $power }
        $power *= 4
        $i = $i -shr 1
    }
    $value
}
(0..9 | ForEach-Object { Get-MoserDeBruijn $_ }) -join ' ' # 0 1 4 5 16 17 20 21 64 65
