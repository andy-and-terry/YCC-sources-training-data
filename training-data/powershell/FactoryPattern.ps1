class Shape {
    [double] Area() {
        throw 'not implemented'
    }
}

class Circle : Shape {
    [double]$Radius
    Circle([double]$radius) { $this.Radius = $radius }
    [double] Area() { return [math]::Pi * $this.Radius * $this.Radius }
}

class Rectangle : Shape {
    [double]$Width
    [double]$Height
    Rectangle([double]$width, [double]$height) {
        $this.Width = $width
        $this.Height = $height
    }
    [double] Area() { return $this.Width * $this.Height }
}

function New-Shape {
    param([string]$Kind, [double[]]$Dimensions)

    switch ($Kind) {
        'circle' { return [Circle]::new($Dimensions[0]) }
        'rectangle' { return [Rectangle]::new($Dimensions[0], $Dimensions[1]) }
        default { throw "unknown shape kind: $Kind" }
    }
}

$shapes = @(
    (New-Shape -Kind 'circle' -Dimensions @(2)),
    (New-Shape -Kind 'rectangle' -Dimensions @(3, 4))
)

foreach ($shape in $shapes) {
    '{0:N2}' -f $shape.Area()
}
