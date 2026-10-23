import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;

public class MethodHandlesDemo {
    static class Greeter {
        private final String prefix;

        Greeter(String prefix) {
            this.prefix = prefix;
        }

        String greet(String name) {
            return prefix + ", " + name + "!";
        }

        static int twice(int x) {
            return x * 2;
        }
    }

    public static void main(String[] args) throws Throwable {
        MethodHandles.Lookup lookup = MethodHandles.lookup();

        // Virtual method: receiver becomes the first argument.
        MethodHandle greet = lookup.findVirtual(
                Greeter.class, "greet", MethodType.methodType(String.class, String.class));
        System.out.println((String) greet.invoke(new Greeter("Hello"), "Ada"));

        // Static method.
        MethodHandle twice = lookup.findStatic(
                Greeter.class, "twice", MethodType.methodType(int.class, int.class));
        System.out.println((int) twice.invokeExact(21));

        // Bind the receiver to get a one-argument handle.
        MethodHandle bound = greet.bindTo(new Greeter("Hi"));
        System.out.println((String) bound.invoke("Bob"));

        // Constructor handle.
        MethodHandle ctor = lookup.findConstructor(
                Greeter.class, MethodType.methodType(void.class, String.class));
        Greeter g = (Greeter) ctor.invoke("Hey");
        System.out.println(g.greet("Cy"));

        // Compose: twice(String.length(x)).
        MethodHandle length = lookup.findVirtual(
                String.class, "length", MethodType.methodType(int.class));
        MethodHandle lenTwice = MethodHandles.filterReturnValue(length, twice);
        System.out.println((int) lenTwice.invokeExact("hello"));
    }
}
