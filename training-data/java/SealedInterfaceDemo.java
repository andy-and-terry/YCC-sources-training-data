public class SealedInterfaceDemo {
    sealed interface Shape permits Circle, Rectangle, Triangle {}

    record Circle(double radius) implements Shape {}
    record Rectangle(double width, double height) implements Shape {}
    record Triangle(double base, double height) implements Shape {}

    static double area(Shape shape) {
        return switch (shape) {
            case Circle c -> Math.PI * c.radius() * c.radius();
            case Rectangle r -> r.width() * r.height();
            case Triangle t -> 0.5 * t.base() * t.height();
        };
    }

    public static void main(String[] args) {
        Shape[] shapes = {new Circle(2), new Rectangle(3, 4), new Triangle(5, 6)};
        for (Shape shape : shapes) {
            System.out.printf("%.2f%n", area(shape));
        }
    }
}
