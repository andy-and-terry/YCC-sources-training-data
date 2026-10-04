public class InterfaceDefaultStaticMethods {
    interface Greeter {
        String name();
        default String greet() { return "Hello, " + name() + suffix(); }
        private String suffix() { return "!"; }
        static Greeter of(String n) { return () -> n; }
    }

    interface Loud extends Greeter {
        @Override default String greet() { return Greeter.super.greet().toUpperCase(); }
    }

    public static void main(String[] args) {
        Greeter g = Greeter.of("Ann");
        System.out.println(g.greet());
        Loud l = () -> "Bob";
        System.out.println(l.greet());
    }
}
