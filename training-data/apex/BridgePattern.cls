public class BridgePattern {
    public interface Renderer {
        String renderCircle(Decimal radius);
    }

    public class VectorRenderer implements Renderer {
        public String renderCircle(Decimal radius) {
            return 'Drawing a vector circle of radius ' + radius;
        }
    }

    public class RasterRenderer implements Renderer {
        public String renderCircle(Decimal radius) {
            return 'Drawing pixels for circle of radius ' + radius;
        }
    }

    public abstract class Shape {
        protected Renderer renderer;
        public Shape(Renderer renderer) {
            this.renderer = renderer;
        }
        public abstract String draw();
    }

    public class Circle extends Shape {
        private Decimal radius;
        public Circle(Renderer renderer, Decimal radius) {
            super(renderer);
            this.radius = radius;
        }
        public override String draw() {
            return renderer.renderCircle(radius);
        }
    }

    public static void main() {
        Shape vectorCircle = new Circle(new VectorRenderer(), 5);
        Shape rasterCircle = new Circle(new RasterRenderer(), 5);
        System.debug(vectorCircle.draw());
        System.debug(rasterCircle.draw());
    }
}
