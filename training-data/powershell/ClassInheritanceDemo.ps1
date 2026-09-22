class Shape {
    [string]$Name

    Shape([string]$name) {
        $this.Name = $name
    }

    [double] Area() {
        return 0.0
    }

    [string] Describe() {
        return "$($this.Name) has area $($this.Area())"
    }
}

class Circle : Shape {
    [double]$Radius

    Circle([double]$radius) : base("Circle") {
        $this.Radius = $radius
    }

    [double] Area() {
        return [math]::Pi * $this.Radius * $this.Radius
    }
}

class Rectangle : Shape {
    [double]$Width
    [double]$Height

    Rectangle([double]$width, [double]$height) : base("Rectangle") {
        $this.Width = $width
        $this.Height = $height
    }

    [double] Area() {
        return $this.Width * $this.Height
    }
}

$shapes = @(
    [Circle]::new(3)
    [Rectangle]::new(4, 5)
)

foreach ($shape in $shapes) {
    $shape.Describe()
}
