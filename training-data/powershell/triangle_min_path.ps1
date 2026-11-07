$triangle = @(@(2), @(3, 4), @(6, 5, 7), @(4, 1, 8, 3))
$dp = [int[]]$triangle[-1]
for ($r = $triangle.Count - 2; $r -ge 0; $r--) {
    for ($i = 0; $i -lt $triangle[$r].Count; $i++) {
        $dp[$i] = $triangle[$r][$i] + [Math]::Min($dp[$i], $dp[$i + 1])
    }
}
$dp[0]   # 11
