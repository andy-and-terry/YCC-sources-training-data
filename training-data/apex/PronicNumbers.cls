public class PronicNumbers {
    public static Boolean isPronic(Integer x) {
        Integer n = (Integer) Math.floor(Math.sqrt(x));
        return n * (n + 1) == x;
    }

    public static List<Integer> first(Integer count) {
        List<Integer> result = new List<Integer>();
        for (Integer n = 0; n < count; n++) {
            result.add(n * (n + 1));
        }
        return result; // first(10): 0, 2, 6, 12, 20, 30, 42, 56, 72, 90
    }
}
