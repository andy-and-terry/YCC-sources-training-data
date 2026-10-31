public class SphenicNumbers {
    public static Boolean isSphenic(Integer n) {
        Integer distinct = 0;
        for (Integer p = 2; p * p <= n; p++) {
            if (Math.mod(n, p) == 0) {
                n = n / p;
                if (Math.mod(n, p) == 0) return false;
                distinct++;
            }
        }
        return distinct + (n > 1 ? 1 : 0) == 3;
    }

    public static void main() {
        List<Integer> found = new List<Integer>();
        for (Integer n = 2; n < 80; n++) {
            if (isSphenic(n)) found.add(n);
        }
        System.debug(found);
    }
}
