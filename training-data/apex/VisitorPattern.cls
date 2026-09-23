public class VisitorPattern {
    public interface Shape {
        Double accept(ShapeVisitor visitor);
    }

    public interface ShapeVisitor {
        Double visitCircle(Circle circle);
        Double visitRectangle(Rectangle rectangle);
    }

    public class Circle implements Shape {
        public Double radius;

        public Circle(Double radius) {
            this.radius = radius;
        }

        public Double accept(ShapeVisitor visitor) {
            return visitor.visitCircle(this);
        }
    }

    public class Rectangle implements Shape {
        public Double width;
        public Double height;

        public Rectangle(Double width, Double height) {
            this.width = width;
            this.height = height;
        }

        public Double accept(ShapeVisitor visitor) {
            return visitor.visitRectangle(this);
        }
    }

    public class AreaVisitor implements ShapeVisitor {
        public Double visitCircle(Circle circle) {
            return Math.PI * circle.radius * circle.radius;
        }

        public Double visitRectangle(Rectangle rectangle) {
            return rectangle.width * rectangle.height;
        }
    }

    public static void main() {
        List<Shape> shapes = new List<Shape>{ new Circle(2), new Rectangle(3, 4) };
        ShapeVisitor areaVisitor = new AreaVisitor();
        for (Shape s : shapes) {
            System.debug(s.accept(areaVisitor));
        }
    }
}
