public class InterfacePrivateMethods {
    interface Greeter {
        String name();

        default String formal() {
            return decorate("Dear", name());
        }

        default String casual() {
            return decorate("Hey", name());
        }

        private String decorate(String salutation, String who) {
            return salutation + " " + who + "!";
        }

        private static String shout(String s) {
            return s.toUpperCase();
        }

        static String loud(Greeter g) {
            return shout(g.casual());
        }
    }

    public static void main(String[] args) {
        Greeter g = () -> "Ada";
        System.out.println(g.formal());
        System.out.println(g.casual());
        System.out.println(Greeter.loud(g));
    }
}
