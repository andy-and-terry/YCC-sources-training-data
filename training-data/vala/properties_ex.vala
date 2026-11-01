class Circle : Object {
    public double radius { get; set; default = 1.0; }
    public double area { get { return Math.PI * radius * radius; } }
}

void main () {
    var c = new Circle ();
    c.radius = 2.0;
    print ("%.2f\n", c.area);
}
