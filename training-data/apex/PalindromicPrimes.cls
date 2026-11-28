public class PalindromicPrimes {
    public static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer i = 2; i * i <= n; i++) {
            if (Math.mod(n, i) == 0) return false;
        }
        return true;
    }

    public static Boolean isPalindrome(Integer n) {
        String s = String.valueOf(n);
        Integer i = 0;
        Integer j = s.length() - 1;
        while (i < j) {
            if (s.substring(i, i + 1) != s.substring(j, j + 1)) return false;
            i++;
            j--;
        }
        return true;
    }

    public static List<Integer> below(Integer limit) {
        List<Integer> result = new List<Integer>();
        for (Integer n = 2; n < limit; n++) {
            if (isPalindrome(n) && isPrime(n)) result.add(n);
        }
        return result; // below(200): 2, 3, 5, 7, 11, 101, 131, 151, 181, 191
    }
}
