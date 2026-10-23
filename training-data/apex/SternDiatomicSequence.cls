public class SternDiatomicSequence {
    // s(0) = 0, s(1) = 1, s(2n) = s(n), s(2n+1) = s(n) + s(n+1)
    public static List<Integer> stern(Integer count) {
        List<Integer> s = new List<Integer>{ 0, 1 };
        for (Integer n = 2; n < count; n++) {
            Integer h = n / 2;
            s.add(Math.mod(n, 2) == 0 ? s[h] : s[h] + s[h + 1]);
        }
        return s;
    }

    public static void main() {
        System.debug(stern(20));
    }
}
