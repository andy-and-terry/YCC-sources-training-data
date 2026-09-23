interface Renderer {
    void renderCircle(double radius)
}

class VectorRenderer implements Renderer {
    void renderCircle(double radius) {
        println "drawing circle of radius $radius as vectors"
    }
}

class RasterRenderer implements Renderer {
    void renderCircle(double radius) {
        println "drawing circle of radius $radius as pixels"
    }
}

abstract class Shape {
    protected Renderer renderer

    Shape(Renderer renderer) {
        this.renderer = renderer
    }

    abstract void draw()
}

class Circle extends Shape {
    double radius

    Circle(Renderer renderer, double radius) {
        super(renderer)
        this.radius = radius
    }

    void draw() {
        renderer.renderCircle(radius)
    }
}

new Circle(new VectorRenderer(), 2.0).draw()
new Circle(new RasterRenderer(), 3.0).draw()
