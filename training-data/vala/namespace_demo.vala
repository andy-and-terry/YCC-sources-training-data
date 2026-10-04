namespace Geometry {
    public const double PI_APPROX = 3.14159;

    public double circle_area (double r) {
        return PI_APPROX * r * r;
    }

    namespace Units {
        public double deg_to_rad (double deg) {
            return deg * PI_APPROX / 180.0;
        }
    }

    public class Square {
        public double side;

        public Square (double side) {
            this.side = side;
        }

        public double area () {
            return side * side;
        }
    }
}

using Geometry;

void main () {
    print ("%.2f\n", circle_area (2.0));
    print ("%.4f\n", Geometry.Units.deg_to_rad (90.0));

    var sq = new Square (3.0);
    print ("%.1f\n", sq.area ());
}
