public class TryWithResourcesSuppressed {
    static class Res implements AutoCloseable {
        final String name;
        Res(String name) { this.name = name; }
        public void close() throws Exception {
            System.out.println("closing " + name);
            throw new Exception("close failed " + name);
        }
    }

    public static void main(String[] args) {
        try (Res a = new Res("a"); Res b = new Res("b")) {
            throw new RuntimeException("body failed");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            for (Throwable t : e.getSuppressed()) System.out.println("suppressed: " + t.getMessage());
        }
    }
}
