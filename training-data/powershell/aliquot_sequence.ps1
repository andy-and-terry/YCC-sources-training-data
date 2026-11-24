# Aliquot sequence: replace n by the sum of its proper divisors.
function Get-AliquotSum([int]$n) {
    $s = 0
    for ($d = 1; $d -le [math]::Floor($n / 2); $d++) {
        if ($n % $d -eq 0) { $s += $d }
    }
    return $s
}

$seq = [System.Collections.Generic.List[int]]::new()
$seq.Add(12)
while ($seq[$seq.Count - 1] -gt 1 -and $seq.Count -lt 20) {
    $seq.Add((Get-AliquotSum $seq[$seq.Count - 1]))
}
$seq -join ' '
