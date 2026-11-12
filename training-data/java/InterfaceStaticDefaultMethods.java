public class InterfaceStaticDefaultMethods {
    interface Shape {
        double area();
        default String describe() { return "area=" + area(); }
        static Shape unit() { return () -> 1.0; }
    }
    public static void main(String[] args) {
        System.out.println(Shape.unit().describe());
    }
}
