function Measure-TrappedWater {
    param([int[]]$Heights)

    $n = $Heights.Length
    if ($n -eq 0) { return 0 }
    $leftMax = [int[]]::new($n)
    $rightMax = [int[]]::new($n)
    $leftMax[0] = $Heights[0]
    for ($i = 1; $i -lt $n; $i++) { $leftMax[$i] = [Math]::Max($leftMax[$i - 1], $Heights[$i]) }
    $rightMax[$n - 1] = $Heights[$n - 1]
    for ($i = $n - 2; $i -ge 0; $i--) { $rightMax[$i] = [Math]::Max($rightMax[$i + 1], $Heights[$i]) }

    $total = 0
    for ($i = 0; $i -lt $n; $i++) {
        $total += [Math]::Min($leftMax[$i], $rightMax[$i]) - $Heights[$i]
    }
    return $total
}

Measure-TrappedWater -Heights @(0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1)
