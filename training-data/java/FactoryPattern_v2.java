public class FactoryPattern_v2 {
    interface Shape {
        double area();

        String name();
    }

    static class Circle implements Shape {
        private final double radius;

        Circle(double radius) {
            this.radius = radius;
        }

        public double area() {
            return Math.PI * radius * radius;
        }

        public String name() {
            return "Circle";
        }
    }

    static class Rectangle implements Shape {
        private final double width, height;

        Rectangle(double width, double height) {
            this.width = width;
            this.height = height;
        }

        public double area() {
            return width * height;
        }

        public String name() {
            return "Rectangle";
        }
    }

    static class ShapeFactory {
        static Shape create(String kind, double... dims) {
            switch (kind) {
                case "circle":
                    return new Circle(dims[0]);
                case "rectangle":
                    return new Rectangle(dims[0], dims[1]);
                default:
                    throw new IllegalArgumentException("unknown shape: " + kind);
            }
        }
    }

    public static void main(String[] args) {
        Shape circle = ShapeFactory.create("circle", 2.0);
        Shape rect = ShapeFactory.create("rectangle", 3.0, 4.0);
        System.out.printf("%s area=%.2f%n", circle.name(), circle.area());
        System.out.printf("%s area=%.2f%n", rect.name(), rect.area());
    }
}
