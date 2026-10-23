public class SealedInterfaceSwitch {
    sealed interface Shape permits Circle, Square {}
    record Circle(double r) implements Shape {}
    record Square(double side) implements Shape {}

    static double area(Shape s) {
        return switch (s) {
            case Circle c -> Math.PI * c.r() * c.r();
            case Square q -> q.side() * q.side();
        };
    }

    public static void main(String[] args) {
        System.out.printf("%.2f%n", area(new Circle(1.5)));
        System.out.printf("%.2f%n", area(new Square(3)));
    }
}
