public class RecordAndSealed {
    sealed interface Shape permits Circle, Square {}
    record Circle(double r) implements Shape {}
    record Square(double s) implements Shape {}

    static double area(Shape s) {
        return switch (s) {
            case Circle c -> Math.PI * c.r() * c.r();
            case Square q -> q.s() * q.s();
        };
    }

    public static void main(String[] args) {
        System.out.println(area(new Square(3)));
        System.out.println(new Circle(1));
    }
}
