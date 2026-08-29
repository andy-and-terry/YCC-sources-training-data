function Test-Safe {
    param([int[]]$Queens, [int]$Col)

    for ($i = 0; $i -lt $Queens.Count; $i++) {
        $dist = $Queens.Count - $i
        if ($Queens[$i] -eq $Col -or [math]::Abs($Queens[$i] - $Col) -eq $dist) {
            return $false
        }
    }
    return $true
}

function Solve-NQueens {
    param([int[]]$Queens, [int]$N)

    if ($Queens.Count -eq $N) { return 1 }
    $count = 0
    for ($col = 0; $col -lt $N; $col++) {
        if (Test-Safe $Queens $col) {
            $count += Solve-NQueens ($Queens + @($col)) $N
        }
    }
    return $count
}

Solve-NQueens -Queens @() -N 6
