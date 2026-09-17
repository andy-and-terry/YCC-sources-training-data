public class FactoryPattern {
    interface Shape {
        double area();
    }

    static class Circle implements Shape {
        private final double radius;

        Circle(double radius) {
            this.radius = radius;
        }

        public double area() {
            return Math.PI * radius * radius;
        }
    }

    static class Square implements Shape {
        private final double side;

        Square(double side) {
            this.side = side;
        }

        public double area() {
            return side * side;
        }
    }

    static class ShapeFactory {
        static Shape create(String kind, double param) {
            return switch (kind) {
                case "circle" -> new Circle(param);
                case "square" -> new Square(param);
                default -> throw new IllegalArgumentException("unknown shape: " + kind);
            };
        }
    }

    public static void main(String[] args) {
        System.out.println(ShapeFactory.create("circle", 2).area());
        System.out.println(ShapeFactory.create("square", 3).area());
    }
}
