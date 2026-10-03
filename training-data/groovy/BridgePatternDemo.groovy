interface Renderer {
    void renderShape(String name)
}

class VectorRenderer implements Renderer {
    void renderShape(String name) {
        println "drawing $name as vector outline"
    }
}

class RasterRenderer implements Renderer {
    void renderShape(String name) {
        println "drawing $name as raster pixels"
    }
}

class Shape {
    Renderer renderer
    String name

    Shape(Renderer renderer, String name) {
        this.renderer = renderer
        this.name = name
    }

    void draw() {
        renderer.renderShape(name)
    }
}

def circle = new Shape(new VectorRenderer(), "circle")
def square = new Shape(new RasterRenderer(), "square")
circle.draw()
square.draw()
