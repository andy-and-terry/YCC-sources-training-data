public class DynamicTypeInstantiation {
    public interface Greeter {
        String greet(String name);
    }

    public class EnglishGreeter implements Greeter {
        public String greet(String name) {
            return 'Hello, ' + name;
        }
    }

    public class SpanishGreeter implements Greeter {
        public String greet(String name) {
            return 'Hola, ' + name;
        }
    }

    public static Greeter createGreeter(String className) {
        Type t = Type.forName(className);
        return (Greeter) t.newInstance();
    }

    public static void main() {
        Greeter g1 = createGreeter('DynamicTypeInstantiation.EnglishGreeter');
        Greeter g2 = createGreeter('DynamicTypeInstantiation.SpanishGreeter');
        System.debug(g1.greet('World'));
        System.debug(g2.greet('World'));
    }
}
