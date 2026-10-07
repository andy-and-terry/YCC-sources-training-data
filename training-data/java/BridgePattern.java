public class BridgePattern {
    interface Renderer {
        String renderCircle(double radius);

        String renderSquare(double side);
    }

    static class VectorRenderer implements Renderer {
        @Override
        public String renderCircle(double radius) {
            return "drawing a vector circle of radius " + radius;
        }

        @Override
        public String renderSquare(double side) {
            return "drawing a vector square of side " + side;
        }
    }

    static class RasterRenderer implements Renderer {
        @Override
        public String renderCircle(double radius) {
            return "drawing " + (int) (radius * radius * 4) + " pixels for a circle";
        }

        @Override
        public String renderSquare(double side) {
            return "drawing " + (int) (side * side) + " pixels for a square";
        }
    }

    abstract static class Shape {
        protected final Renderer renderer;

        Shape(Renderer renderer) {
            this.renderer = renderer;
        }

        abstract String draw();
    }

    static class Circle extends Shape {
        private final double radius;

        Circle(Renderer renderer, double radius) {
            super(renderer);
            this.radius = radius;
        }

        @Override
        String draw() {
            return renderer.renderCircle(radius);
        }
    }

    static class Square extends Shape {
        private final double side;

        Square(Renderer renderer, double side) {
            super(renderer);
            this.side = side;
        }

        @Override
        String draw() {
            return renderer.renderSquare(side);
        }
    }

    public static void main(String[] args) {
        Renderer vector = new VectorRenderer();
        Renderer raster = new RasterRenderer();

        Shape[] shapes = {
            new Circle(vector, 3.0),
            new Circle(raster, 3.0),
            new Square(vector, 4.0),
            new Square(raster, 4.0),
        };

        for (Shape shape : shapes) {
            System.out.println(shape.draw());
        }
    }
}
