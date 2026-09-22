import java.util.HashMap;
import java.util.Map;

public class PrototypePattern {
    interface Shape extends Cloneable {
        Shape clone();

        String describe();
    }

    static class Circle implements Shape {
        int radius;
        String color;

        Circle(int radius, String color) {
            this.radius = radius;
            this.color = color;
        }

        @Override
        public Circle clone() {
            return new Circle(radius, color);
        }

        @Override
        public String describe() {
            return "circle r=" + radius + " color=" + color;
        }
    }

    static class Rectangle implements Shape {
        int width;
        int height;

        Rectangle(int width, int height) {
            this.width = width;
            this.height = height;
        }

        @Override
        public Rectangle clone() {
            return new Rectangle(width, height);
        }

        @Override
        public String describe() {
            return "rectangle " + width + "x" + height;
        }
    }

    static class ShapeRegistry {
        private final Map<String, Shape> prototypes = new HashMap<>();

        void register(String key, Shape prototype) {
            prototypes.put(key, prototype);
        }

        Shape create(String key) {
            Shape prototype = prototypes.get(key);
            if (prototype == null) {
                throw new IllegalArgumentException("unknown prototype: " + key);
            }
            return prototype.clone();
        }
    }

    public static void main(String[] args) {
        ShapeRegistry registry = new ShapeRegistry();
        registry.register("small-red-circle", new Circle(2, "red"));
        registry.register("big-rectangle", new Rectangle(10, 20));

        Shape a = registry.create("small-red-circle");
        Shape b = registry.create("small-red-circle");
        ((Circle) b).color = "blue";

        System.out.println(a.describe());
        System.out.println(b.describe());
        System.out.println(a == b);
        System.out.println(registry.create("big-rectangle").describe());
    }
}
