public class RecordPatternMatching {
    record Point(int x, int y) {}
    sealed interface Shape permits Circle, Rectangle {}
    record Circle(Point center, double radius) implements Shape {}
    record Rectangle(Point topLeft, Point bottomRight) implements Shape {}

    static String describe(Shape shape) {
        return switch (shape) {
            case Circle(Point(var x, var y), var radius) when radius > 10 ->
                "large circle at (" + x + ", " + y + ")";
            case Circle(Point p, var radius) ->
                "circle at " + p + " with radius " + radius;
            case Rectangle(Point(var x1, var y1), Point(var x2, var y2)) ->
                "rectangle from (" + x1 + "," + y1 + ") to (" + x2 + "," + y2 + ")";
        };
    }

    public static void main(String[] args) {
        Shape[] shapes = {
            new Circle(new Point(0, 0), 5),
            new Circle(new Point(1, 1), 20),
            new Rectangle(new Point(0, 0), new Point(4, 3))
        };
        for (Shape shape : shapes) {
            System.out.println(describe(shape));
        }
    }
}
