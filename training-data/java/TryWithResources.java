import java.io.IOException;

public class TryWithResources {
    static class Resource implements AutoCloseable {
        private final String name;

        Resource(String name) {
            this.name = name;
            System.out.println("opening " + name);
        }

        void use() {
            System.out.println("using " + name);
        }

        @Override
        public void close() {
            System.out.println("closing " + name);
        }
    }

    static class FailingResource implements AutoCloseable {
        @Override
        public void close() throws IOException {
            throw new IOException("close failed");
        }
    }

    public static void main(String[] args) {
        try (Resource a = new Resource("A"); Resource b = new Resource("B")) {
            a.use();
            b.use();
        }

        try (FailingResource ignored = new FailingResource()) {
            System.out.println("body");
        } catch (IOException e) {
            System.out.println("caught: " + e.getMessage());
        }
    }
}
