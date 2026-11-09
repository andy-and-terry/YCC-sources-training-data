public class TryWithResourcesDemo {
    static class R implements AutoCloseable {
        final String n;
        R(String n) { this.n = n; System.out.println("open " + n); }
        public void close() { System.out.println("close " + n); }
    }

    public static void main(String[] args) {
        try (R a = new R("a"); R b = new R("b")) {
            System.out.println("body");
        }
    }
}
