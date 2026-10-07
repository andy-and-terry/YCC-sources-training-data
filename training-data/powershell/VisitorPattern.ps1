class Circle {
    [double]$Radius
    Circle([double]$radius) { $this.Radius = $radius }
    [double] Accept([object]$visitor) { return $visitor.VisitCircle($this) }
}

class Rectangle {
    [double]$Width
    [double]$Height
    Rectangle([double]$width, [double]$height) { $this.Width = $width; $this.Height = $height }
    [double] Accept([object]$visitor) { return $visitor.VisitRectangle($this) }
}

class AreaVisitor {
    [double] VisitCircle([Circle]$circle) { return [Math]::PI * $circle.Radius * $circle.Radius }
    [double] VisitRectangle([Rectangle]$rect) { return $rect.Width * $rect.Height }
}

$shapes = @([Circle]::new(2), [Rectangle]::new(3, 4))
$visitor = [AreaVisitor]::new()
foreach ($shape in $shapes) { $shape.Accept($visitor) }
