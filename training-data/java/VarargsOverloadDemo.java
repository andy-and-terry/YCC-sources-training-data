public class VarargsOverloadDemo {
    static String pick(int a) { return "int"; }

    static String pick(long a) { return "long"; }

    static String pick(Integer a) { return "Integer"; }

    static String pick(int... a) { return "varargs(" + a.length + ")"; }

    static String pick(Object o) { return "Object"; }

    static int sum(int... values) {
        int total = 0;
        for (int v : values) {
            total += v;
        }
        return total;
    }

    static String describe(String label, Object... items) {
        return label + ":" + (items == null ? "null" : items.length);
    }

    public static void main(String[] args) {
        System.out.println(pick(1));
        System.out.println(pick((short) 1));
        System.out.println(pick(Integer.valueOf(1)));
        System.out.println(pick());
        System.out.println(pick(1, 2));
        System.out.println(pick("s"));

        System.out.println(sum() + " " + sum(4) + " " + sum(1, 2, 3));
        System.out.println(describe("none"));
        System.out.println(describe("two", "a", "b"));
        System.out.println(describe("nullArr", (Object[]) null));
        System.out.println(describe("nested", (Object) new Object[]{1, 2}));
    }
}
