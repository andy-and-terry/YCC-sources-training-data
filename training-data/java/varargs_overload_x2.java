public class VarargsOverloadX2 {
    static int sum(int... xs) { int s = 0; for (int x : xs) s += x; return s; }
    static String sum(String a, String b) { return a + b; }

    public static void main(String[] args) {
        System.out.println(sum(1, 2, 3) + " " + sum("a", "b") + " " + sum());
    }
}
