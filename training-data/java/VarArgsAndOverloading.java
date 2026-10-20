public class VarArgsAndOverloading {
    static int sum(int... xs) { int s = 0; for (int x : xs) s += x; return s; }
    static String show(Object o) { return "obj"; }
    static String show(String s) { return "str"; }
    static String show(Integer i) { return "int"; }

    public static void main(String[] args) {
        System.out.println(sum() + " " + sum(1, 2, 3));
        System.out.println(show("a") + show(1) + show(2.0));
    }
}
