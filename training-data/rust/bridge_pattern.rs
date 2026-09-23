// Bridge pattern: split an abstraction (Shape) from its implementation
// (Renderer) via a trait, so either side can grow independently. The
// shape holds a boxed renderer rather than baking rendering logic in.
trait Renderer {
    fn render_circle(&self, radius: f64) -> String;
    fn render_square(&self, side: f64) -> String;
}

struct VectorRenderer;
impl Renderer for VectorRenderer {
    fn render_circle(&self, radius: f64) -> String {
        format!("drawing a circle of radius {} as a math outline", radius)
    }
    fn render_square(&self, side: f64) -> String {
        format!("drawing a square of side {} as a math outline", side)
    }
}

struct RasterRenderer;
impl Renderer for RasterRenderer {
    fn render_circle(&self, radius: f64) -> String {
        format!("drawing a circle of radius {} as pixels", radius)
    }
    fn render_square(&self, side: f64) -> String {
        format!("drawing a square of side {} as pixels", side)
    }
}

trait Shape {
    fn draw(&self) -> String;
}

struct Circle {
    renderer: Box<dyn Renderer>,
    radius: f64,
}
impl Shape for Circle {
    fn draw(&self) -> String {
        self.renderer.render_circle(self.radius)
    }
}

struct Square {
    renderer: Box<dyn Renderer>,
    side: f64,
}
impl Shape for Square {
    fn draw(&self) -> String {
        self.renderer.render_square(self.side)
    }
}

fn main() {
    let shapes: Vec<Box<dyn Shape>> = vec![
        Box::new(Circle { renderer: Box::new(VectorRenderer), radius: 5.0 }),
        Box::new(Square { renderer: Box::new(RasterRenderer), side: 3.0 }),
    ];
    for shape in &shapes {
        println!("{}", shape.draw());
    }
}
