public class HappyNumbers {
    public static Boolean isHappy(Integer n) {
        Set<Integer> seen = new Set<Integer>();
        while (n != 1 && !seen.contains(n)) {
            seen.add(n);
            Integer s = 0;
            for (Integer m = n; m > 0; m = m / 10) {
                s += Math.mod(m, 10) * Math.mod(m, 10);
            }
            n = s;
        }
        return n == 1;
    }

    public static List<Integer> firstHappy(Integer count) {
        List<Integer> found = new List<Integer>();
        for (Integer n = 1; found.size() < count; n++) {
            if (isHappy(n)) found.add(n);
        }
        return found; // (1, 7, 10, 13, 19, 23, 28, 31)
    }
}
