function Get-HammingDistance {
    param([string]$A, [string]$B)
    if ($A.Length -ne $B.Length) {
        throw "Inputs must be the same length ($($A.Length) vs $($B.Length))"
    }
    $d = 0
    for ($i = 0; $i -lt $A.Length; $i++) {
        if ($A[$i] -ne $B[$i]) { $d++ }
    }
    $d
}

Get-HammingDistance 'karolin' 'kathrin'
Get-HammingDistance '1011101' '1001001'
try { Get-HammingDistance 'abc' 'abcd' } catch { "Error: $($_.Exception.Message)" }
