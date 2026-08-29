public class InterfaceDemo implements InterfaceDemo.Shape {
    public interface Shape {
        Double area();
    }

    private Double width;
    private Double height;

    public InterfaceDemo(Double width, Double height) {
        this.width = width;
        this.height = height;
    }

    public Double area() {
        return width * height;
    }

    public static void main() {
        Shape s = new InterfaceDemo(4, 5);
        System.debug(s.area());
    }
}
