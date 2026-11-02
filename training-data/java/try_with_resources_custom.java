public class TryWithResourcesCustom {
    static class Res implements AutoCloseable {
        final String n;
        Res(String n) { this.n = n; System.out.println("open " + n); }
        public void close() { System.out.println("close " + n); }
    }

    public static void main(String[] args) {
        try (Res a = new Res("a"); Res b = new Res("b")) {
            System.out.println("body");
        }
    }
}
