struct Circle {
    var r: Double
    var area: Double { Double.pi * r * r }
    lazy var label: String = { "circle r=\(r)" }()
}
var c = Circle(r: 2)
print(c.label, String(format: "%.2f", c.area))
