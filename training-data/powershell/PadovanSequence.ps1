# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
function Get-Padovan([int]$Count) {
    $p = @()
    for ($i = 0; $i -lt $Count; $i++) {
        if ($i -lt 3) { $p += 1 } else { $p += $p[$i - 2] + $p[$i - 3] }
    }
    $p
}

(Get-Padovan 15) -join ' '
