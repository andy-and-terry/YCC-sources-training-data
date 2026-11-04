function Test-Toeplitz([int[][]]$m) {
    for ($i = 1; $i -lt $m.Count; $i++) {
        for ($j = 1; $j -lt $m[$i].Count; $j++) {
            if ($m[$i][$j] -ne $m[$i - 1][$j - 1]) { return $false }
        }
    }
    $true
}

Test-Toeplitz @(@(1, 2, 3), @(4, 1, 2), @(5, 4, 1))
Test-Toeplitz @(@(1, 2), @(2, 2))
