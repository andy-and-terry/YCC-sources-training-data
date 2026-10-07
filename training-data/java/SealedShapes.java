public class SealedShapes {
    sealed interface Shape permits Circle, Rect, Triangle {}
    record Circle(double r) implements Shape {}
    record Rect(double w, double h) implements Shape {}
    record Triangle(double b, double h) implements Shape {}

    static double area(Shape s) {
        return switch (s) {
            case Circle c -> Math.PI * c.r() * c.r();
            case Rect r -> r.w() * r.h();
            case Triangle t -> 0.5 * t.b() * t.h();
        };
    }

    public static void main(String[] args) {
        Shape[] shapes = {new Circle(1), new Rect(2, 3), new Triangle(4, 5)};
        for (Shape s : shapes) System.out.printf("%s -> %.2f%n", s, area(s));
    }
}
