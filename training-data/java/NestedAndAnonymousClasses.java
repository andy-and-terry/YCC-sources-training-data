public class NestedAndAnonymousClasses {
    private int counter = 0;

    class Inner {
        int bump() { return ++counter; }
    }

    static class StaticNested {
        String hi() { return "static nested"; }
    }

    interface Shape { double area(); }

    public static void main(String[] args) {
        NestedAndAnonymousClasses outer = new NestedAndAnonymousClasses();
        NestedAndAnonymousClasses.Inner in = outer.new Inner();
        in.bump();
        System.out.println(in.bump());
        System.out.println(new StaticNested().hi());

        Shape sq = new Shape() {
            double side = 3;
            public double area() { return side * side; }
            @Override public String toString() { return "anon square " + area(); }
        };
        System.out.println(sq);

        class Local { String id() { return "local class"; } }
        System.out.println(new Local().id());
    }
}
