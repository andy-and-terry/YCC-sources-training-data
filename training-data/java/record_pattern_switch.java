public class RecordPatternSwitch {
    sealed interface Shape permits Circle, Rect {}
    record Circle(double r) implements Shape {}
    record Rect(double w, double h) implements Shape {}

    static double area(Shape s) {
        return switch (s) {
            case Circle c -> Math.PI * c.r() * c.r();
            case Rect(double w, double h) -> w * h;
        };
    }

    public static void main(String[] args) {
        System.out.println(area(new Rect(2, 3)));
    }
}
