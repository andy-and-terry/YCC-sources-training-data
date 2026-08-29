public class ArmstrongNumber {
    public static Boolean isArmstrong(Integer n) {
        String s = String.valueOf(n);
        Integer k = s.length();
        Integer total = 0;
        for (Integer i = 0; i < k; i++) {
            Integer digit = Integer.valueOf(s.substring(i, i + 1));
            total += Math.pow(digit, k).intValue();
        }
        return total == n;
    }

    public static void main() {
        List<Integer> results = new List<Integer>();
        for (Integer n = 1; n <= 1000; n++) {
            if (isArmstrong(n)) {
                results.add(n);
            }
        }
        System.debug(results);
    }
}
