public class BridgePattern {
    public interface Renderer {
        String renderCircle(Double radius);
    }

    public class VectorRenderer implements Renderer {
        public String renderCircle(Double radius) {
            return 'Drawing circle of radius ' + radius + ' as vector';
        }
    }

    public class RasterRenderer implements Renderer {
        public String renderCircle(Double radius) {
            return 'Drawing circle of radius ' + radius + ' as pixels';
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
        private Double radius;
        public Circle(Renderer renderer, Double radius) {
            super(renderer);
            this.radius = radius;
        }
        public override String draw() {
            return renderer.renderCircle(radius);
        }
    }

    public static void main() {
        Shape vectorCircle = new Circle(new VectorRenderer(), 5.0);
        Shape rasterCircle = new Circle(new RasterRenderer(), 5.0);
        System.debug(vectorCircle.draw());
        System.debug(rasterCircle.draw());
    }
}
