# Shoelace polygon area with PSCustomObject points.
$pts = @(
    [pscustomobject]@{ X = 0; Y = 0 }, [pscustomobject]@{ X = 4; Y = 0 },
    [pscustomobject]@{ X = 4; Y = 3 }, [pscustomobject]@{ X = 0; Y = 3 })
$s = 0
for ($i = 0; $i -lt $pts.Count; $i++) {
    $q = $pts[($i + 1) % $pts.Count]
    $s += $pts[$i].X * $q.Y - $q.X * $pts[$i].Y
}
[math]::Abs($s) / 2
