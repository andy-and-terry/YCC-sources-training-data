function Get-LongestIncreasingSubsequence {
    param([int[]]$Numbers)

    $n = $Numbers.Count
    if ($n -eq 0) { return 0 }
    $lengths = New-Object int[] $n
    for ($i = 0; $i -lt $n; $i++) { $lengths[$i] = 1 }

    for ($i = 1; $i -lt $n; $i++) {
        for ($j = 0; $j -lt $i; $j++) {
            if ($Numbers[$j] -lt $Numbers[$i] -and $lengths[$j] + 1 -gt $lengths[$i]) {
                $lengths[$i] = $lengths[$j] + 1
            }
        }
    }
    return ($lengths | Measure-Object -Maximum).Maximum
}

Get-LongestIncreasingSubsequence -Numbers @(10, 9, 2, 5, 3, 7, 101, 18)
