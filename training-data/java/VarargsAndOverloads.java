public class VarargsAndOverloads {
    static int sum(int... xs) {
        int total = 0;
        for (int x : xs) total += x;
        return total;
    }

    static String describe(Object o) { return "object"; }
    static String describe(String s) { return "string"; }
    static String describe(Integer i) { return "integer"; }

    public static void main(String[] args) {
        System.out.println(sum() + " " + sum(1) + " " + sum(1, 2, 3));
        System.out.println(describe("x") + " " + describe(5) + " " + describe(2.0));
    }
}
