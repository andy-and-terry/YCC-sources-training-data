// Disarium numbers: digits raised to their 1-based positions sum to n.
public class DisariumNumbers {
    static Boolean isDisarium(Integer n) {
        List<String> digits = String.valueOf(n).split('');
        Integer total = 0;
        for (Integer i = 0; i < digits.size(); i++) {
            total += (Integer) Math.pow(Integer.valueOf(digits[i]), i + 1);
        }
        return total == n;
    }

    public static void run() {
        List<String> out = new List<String>();
        for (Integer n = 1; n < 1000; n++) {
            if (isDisarium(n)) out.add(String.valueOf(n));
        }
        System.debug(String.join(out, ' '));
    }
}
