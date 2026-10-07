public class InterfaceDefaultStaticDemo {
    interface Greeter {
        String name();

        default String greet() {
            return prefix() + name();
        }

        private String prefix() {
            return "Hello, ";
        }

        static Greeter of(String n) {
            return () -> n;
        }
    }

    public static void main(String[] args) {
        Greeter g = Greeter.of("World");
        System.out.println(g.greet());
        Greeter loud = new Greeter() {
            public String name() { return "JAVA"; }
            public String greet() { return Greeter.super.greet().toUpperCase() + "!"; }
        };
        System.out.println(loud.greet());
    }
}
