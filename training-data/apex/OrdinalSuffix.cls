public class OrdinalSuffix {
    public static String ordinal(Integer n) {
        Integer r100 = Math.mod(n, 100);
        Integer r10 = Math.mod(n, 10);
        String suffix = 'th';
        if (r100 < 11 || r100 > 13) {
            if (r10 == 1) suffix = 'st';
            else if (r10 == 2) suffix = 'nd';
            else if (r10 == 3) suffix = 'rd';
        }
        return n + suffix;
    }

    public static void demo() {
        List<String> out = new List<String>();
        for (Integer n : new List<Integer>{1, 2, 3, 4, 11, 12, 13, 21, 101, 111}) {
            out.add(ordinal(n));
        }
        System.debug(String.join(out, ' '));
    }
}
