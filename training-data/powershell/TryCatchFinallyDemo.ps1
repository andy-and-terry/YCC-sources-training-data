function Invoke-Divide {
    param([int]$A, [int]$B)
    try {
        $A / $B
    }
    catch [System.DivideByZeroException] {
        Write-Output 'cannot divide by zero'
    }
    finally {
        Write-Output 'done dividing'
    }
}

Invoke-Divide -A 10 -B 2
Invoke-Divide -A 1 -B 0
