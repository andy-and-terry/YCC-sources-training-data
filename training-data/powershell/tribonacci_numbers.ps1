# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
function Get-Tribonacci {
    param([int]$Count)
    $t = @(0, 0, 1)
    while ($t.Count -lt $Count) {
        $n = $t.Count
        $t += $t[$n - 1] + $t[$n - 2] + $t[$n - 3]
    }
    $t[0..($Count - 1)]
}

"Tribonacci: " + ((Get-Tribonacci -Count 15) -join ", ")
