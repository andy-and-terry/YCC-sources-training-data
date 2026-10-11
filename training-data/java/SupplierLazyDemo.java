import java.util.function.Supplier;

public class SupplierLazyDemo {
    static class Lazy<T> implements Supplier<T> {
        private Supplier<T> init;
        private T value;

        Lazy(Supplier<T> init) {
            this.init = init;
        }

        @Override
        public synchronized T get() {
            if (init != null) {
                value = init.get();
                init = null;
            }
            return value;
        }
    }

    public static void main(String[] args) {
        Lazy<String> lazy = new Lazy<>(() -> {
            System.out.println("computing...");
            return "expensive result";
        });
        System.out.println("created");
        System.out.println(lazy.get());
        System.out.println(lazy.get());
    }
}
