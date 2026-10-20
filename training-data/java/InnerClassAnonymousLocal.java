public class InnerClassAnonymousLocal {
    private int base = 10;
    class Inner { int plus(int n) { return base + n; } }
    static class Nested { String hi() { return "nested"; } }

    public static void main(String[] args) {
        InnerClassAnonymousLocal o = new InnerClassAnonymousLocal();
        System.out.println(o.new Inner().plus(5) + " " + new Nested().hi());
        Runnable r = new Runnable() { public void run() { System.out.println("anon " + o.base); } };
        r.run();
        class Local { int twice(int x) { return 2 * x; } }
        System.out.println(new Local().twice(21));
    }
}
