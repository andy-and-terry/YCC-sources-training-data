public class InterfaceDefaultMethodsDemo {
    interface Greeter {
        String name();

        default String greet() {
            return "Hello, " + name() + suffix();
        }

        private String suffix() {
            return "!";
        }

        static Greeter of(String name) {
            return () -> name;
        }
    }

    interface Formal extends Greeter {
        @Override
        default String greet() {
            return "Good day, " + name() + ".";
        }
    }

    static class Butler implements Formal {
        public String name() { return "Sir"; }
    }

    static class Pirate implements Greeter {
        public String name() { return "matey"; }

        @Override
        public String greet() {
            return Greeter.super.greet().toUpperCase();
        }
    }

    public static void main(String[] args) {
        System.out.println(Greeter.of("Ada").greet());
        System.out.println(new Butler().greet());
        System.out.println(new Pirate().greet());
    }
}
