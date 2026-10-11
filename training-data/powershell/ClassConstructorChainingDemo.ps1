class Rectangle {
    [double] $Width
    [double] $Height

    Rectangle() : this(1, 1) { }

    Rectangle([double]$side) : this($side, $side) { }

    Rectangle([double]$w, [double]$h) {
        $this.Width = $w
        $this.Height = $h
    }

    [double] Area() { return $this.Width * $this.Height }

    [string] ToString() { return "$($this.Width)x$($this.Height)" }
}

foreach ($r in [Rectangle]::new(), [Rectangle]::new(4), [Rectangle]::new(3, 5)) {
    "$r area=$($r.Area())"
}
