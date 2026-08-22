function Invoke-SafeDivide {
    param([int]$A, [int]$B)
    try {
        if ($B -eq 0) {
            throw "division by zero"
        }
        return $A / $B
    }
    catch {
        Write-Output "error: $_"
        return $null
    }
}

Invoke-SafeDivide -A 10 -B 2
Invoke-SafeDivide -A 5 -B 0
