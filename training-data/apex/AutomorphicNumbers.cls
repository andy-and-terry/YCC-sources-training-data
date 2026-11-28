public class AutomorphicNumbers {
    public static Boolean isAutomorphic(Long n) {
        return String.valueOf(n * n).endsWith(String.valueOf(n));
    }

    public static List<Long> upTo(Long limit) {
        List<Long> result = new List<Long>();
        for (Long n = 0; n <= limit; n++) {
            if (isAutomorphic(n)) result.add(n);
        }
        return result; // upTo(999): 0, 1, 5, 6, 25, 76, 376, 625
    }
}
