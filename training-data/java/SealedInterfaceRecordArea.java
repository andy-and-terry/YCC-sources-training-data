public class SealedInterfaceRecordArea {
    sealed interface Shape permits Circle, Rect {}
    record Circle(double r) implements Shape {}
    record Rect(double w, double h) implements Shape {}

    static double area(Shape s) {
        return switch (s) {
            case Circle c -> Math.PI * c.r() * c.r();
            case Rect r -> r.w() * r.h();
        };
    }

    public static void main(String[] args) {
        System.out.println(area(new Rect(3, 4)));
        System.out.printf("%.2f%n", area(new Circle(1)));
    }
}
