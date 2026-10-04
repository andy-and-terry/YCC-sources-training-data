public class InterfaceDefaultStaticDemo {
    interface Greeter {
        String name();

        default String greet() {
            return prefix() + ", " + name() + "!";
        }

        private String prefix() {
            return "Hello";
        }

        static Greeter of(String name) {
            return () -> name;
        }
    }

    interface Polite extends Greeter {
        @Override
        default String greet() {
            return Greeter.super.greet() + " Pleased to meet you.";
        }
    }

    public static void main(String[] args) {
        System.out.println(Greeter.of("Ada").greet());

        Polite p = () -> "Grace";
        System.out.println(p.greet());
    }
}
