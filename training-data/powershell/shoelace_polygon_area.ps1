function Get-PolygonArea($Points) {
    $s = 0
    for ($i = 0; $i -lt $Points.Count; $i++) {
        $a = $Points[$i]
        $b = $Points[($i + 1) % $Points.Count]
        $s += $a[0] * $b[1] - $b[0] * $a[1]
    }
    [math]::Abs($s) / 2
}

Get-PolygonArea @(@(0, 0), @(4, 0), @(4, 3), @(0, 3))
