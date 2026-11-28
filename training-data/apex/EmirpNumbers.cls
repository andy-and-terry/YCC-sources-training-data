public class EmirpNumbers {
    public static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer i = 2; i * i <= n; i++) {
            if (Math.mod(n, i) == 0) return false;
        }
        return true;
    }

    public static Integer reverseNumber(Integer n) {
        String s = String.valueOf(n);
        String r = '';
        for (Integer i = s.length() - 1; i >= 0; i--) r += s.substring(i, i + 1);
        return Integer.valueOf(r);
    }

    public static List<Integer> below(Integer limit) {
        List<Integer> result = new List<Integer>();
        for (Integer p = 2; p < limit; p++) {
            Integer r = reverseNumber(p);
            if (r != p && isPrime(p) && isPrime(r)) result.add(p);
        }
        return result; // below(200): 13, 17, 31, 37, 71, 73, 79, 97, 107, ...
    }
}
