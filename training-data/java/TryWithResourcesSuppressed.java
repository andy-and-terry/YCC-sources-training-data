public class TryWithResourcesSuppressed {
    static class Res implements AutoCloseable {
        final String n;
        Res(String n) { this.n = n; System.out.println("open " + n); }
        public void close() throws Exception { System.out.println("close " + n); throw new Exception("close-" + n); }
    }

    public static void main(String[] args) {
        try (Res a = new Res("a"); Res b = new Res("b")) {
            throw new RuntimeException("body");
        } catch (Exception e) {
            System.out.println(e.getMessage() + " suppressed=" + e.getSuppressed().length);
        }
    }
}
