# Bulls and Cows scoring for equal-length digit strings.
function Get-Score([string]$secret, [string]$guess) {
    $bulls = 0
    $sc = @{}
    $gc = @{}
    for ($i = 0; $i -lt $secret.Length; $i++) {
        $s = $secret[$i]; $g = $guess[$i]
        if ($s -eq $g) { $bulls++ }
        else {
            $sc[$s] = 1 + [int]$sc[$s]
            $gc[$g] = 1 + [int]$gc[$g]
        }
    }
    $cows = 0
    foreach ($c in $sc.Keys) {
        $cows += [Math]::Min($sc[$c], [int]$gc[$c])
    }
    [pscustomobject]@{ Bulls = $bulls; Cows = $cows }
}

$r = Get-Score '1807' '7810'
"$($r.Bulls) bull(s), $($r.Cows) cow(s)"
