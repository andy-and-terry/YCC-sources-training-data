public class InterfaceDefaultStatic {
    interface Greeter {
        String name();
        default String greet() { return "Hello, " + name(); }
        static Greeter of(String n) { return () -> n; }
    }

    public static void main(String[] args) {
        System.out.println(Greeter.of("world").greet());
    }
}
