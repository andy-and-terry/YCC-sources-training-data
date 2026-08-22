class Point {
    [double]$X
    [double]$Y

    Point([double]$x, [double]$y) {
        $this.X = $x
        $this.Y = $y
    }

    [Point] Add([Point]$other) {
        return [Point]::new($this.X + $other.X, $this.Y + $other.Y)
    }

    [string] ToString() {
        return "($($this.X), $($this.Y))"
    }
}

$p1 = [Point]::new(1, 2)
$p2 = [Point]::new(3, 4)
$p3 = $p1.Add($p2)
$p3.ToString()
