class Circle {
    [double]$Radius
    Circle([double]$radius) { $this.Radius = $radius }
    [double] Area() { return [Math]::PI * $this.Radius * $this.Radius }
}

class Square {
    [double]$Side
    Square([double]$side) { $this.Side = $side }
    [double] Area() { return $this.Side * $this.Side }
}

class ShapeFactory {
    static [object] Create([string]$kind, [double]$size) {
        switch ($kind) {
            'circle' { return [Circle]::new($size) }
            'square' { return [Square]::new($size) }
            default { throw "unknown shape: $kind" }
        }
    }
}

foreach ($spec in @(@('circle', 3), @('square', 4))) {
    $shape = [ShapeFactory]::Create($spec[0], $spec[1])
    "{0} area: {1:N2}" -f $spec[0], $shape.Area()
}
