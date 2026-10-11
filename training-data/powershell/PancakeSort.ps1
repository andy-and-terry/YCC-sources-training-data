function Invoke-Flip {
    param([int[]]$Array, [int]$K)
    for ($i = 0; $i -lt $K / 2; $i++) {
        $j = $K - 1 - $i
        $Array[$i], $Array[$j] = $Array[$j], $Array[$i]
    }
}

function Invoke-PancakeSort {
    param([int[]]$Array)
    $a = $Array.Clone()
    for ($size = $a.Length; $size -gt 1; $size--) {
        $maxIdx = 0
        for ($i = 1; $i -lt $size; $i++) {
            if ($a[$i] -gt $a[$maxIdx]) { $maxIdx = $i }
        }
        if ($maxIdx -ne $size - 1) {
            Invoke-Flip -Array $a -K ($maxIdx + 1)
            Invoke-Flip -Array $a -K $size
        }
    }
    return $a
}

(Invoke-PancakeSort -Array @(3, 6, 1, 9, 4, 2)) -join ' '
