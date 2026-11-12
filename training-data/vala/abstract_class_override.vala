abstract class Shape { public abstract double area (); }
class Sq : Shape { double s; public Sq (double s) { this.s = s; } public override double area () { return s * s; } }
void main () { print ("%.1f\n", new Sq (3).area ()); }
