public class TryWithResourcesCloseOrder {
    static class Res implements AutoCloseable {
        private final String name;
        Res(String name) { this.name = name; System.out.println("open " + name); }
        @Override public void close() { System.out.println("close " + name); }
    }

    public static void main(String[] args) {
        try (Res a = new Res("A"); Res b = new Res("B")) {
            System.out.println("body");
            throw new IllegalStateException("fail");
        } catch (IllegalStateException e) {
            System.out.println("caught " + e.getMessage());
        } finally {
            System.out.println("finally");
        }
    }
}
