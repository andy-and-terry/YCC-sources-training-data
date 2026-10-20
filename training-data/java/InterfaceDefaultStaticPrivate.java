public class InterfaceDefaultStaticPrivate {
    interface Validator {
        boolean test(String s);
        default Validator and(Validator o) { return s -> test(s) && o.test(s); }
        static Validator notEmpty() { return s -> !s.isEmpty(); }
        private String unused() { return "x"; }
    }

    public static void main(String[] args) {
        Validator v = Validator.notEmpty().and(s -> s.length() < 5);
        System.out.println(v.test("abc") + " " + v.test("abcdef") + " " + v.test(""));
    }
}
