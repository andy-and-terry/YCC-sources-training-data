public class VirtualOverrideDemo {
    public virtual class Shape {
        protected String name;

        public Shape(String name) {
            this.name = name;
        }

        public virtual Decimal area() {
            return 0;
        }

        public virtual String describe() {
            return name + ' with area ' + area().setScale(2);
        }
    }

    public class Circle extends Shape {
        private Decimal radius;

        public Circle(Decimal radius) {
            super('Circle');
            this.radius = radius;
        }

        public override Decimal area() {
            return Math.PI * radius * radius;
        }
    }

    public class Rectangle extends Shape {
        private Decimal w;
        private Decimal h;

        public Rectangle(Decimal w, Decimal h) {
            super('Rectangle');
            this.w = w;
            this.h = h;
        }

        public override Decimal area() {
            return w * h;
        }

        public override String describe() {
            return super.describe() + ' (' + w + 'x' + h + ')';
        }
    }

    public static void main() {
        List<Shape> shapes = new List<Shape>{ new Circle(2), new Rectangle(3, 4), new Shape('Blob') };
        for (Shape s : shapes) {
            System.debug(s.describe());
        }
    }
}
