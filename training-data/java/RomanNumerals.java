import java.util.LinkedHashMap;
import java.util.Map;

public class RomanNumerals {
    private static final Map<Integer, String> VALUES = new LinkedHashMap<>();
    static {
        VALUES.put(1000, "M"); VALUES.put(900, "CM"); VALUES.put(500, "D"); VALUES.put(400, "CD");
        VALUES.put(100, "C"); VALUES.put(90, "XC"); VALUES.put(50, "L"); VALUES.put(40, "XL");
        VALUES.put(10, "X"); VALUES.put(9, "IX"); VALUES.put(5, "V"); VALUES.put(4, "IV"); VALUES.put(1, "I");
    }

    public static String toRoman(int n) {
        StringBuilder result = new StringBuilder();
        for (Map.Entry<Integer, String> entry : VALUES.entrySet()) {
            while (n >= entry.getKey()) {
                result.append(entry.getValue());
                n -= entry.getKey();
            }
        }
        return result.toString();
    }

    public static int fromRoman(String s) {
        Map<Character, Integer> values = Map.of('I', 1, 'V', 5, 'X', 10, 'L', 50, 'C', 100, 'D', 500, 'M', 1000);
        int total = 0;
        for (int i = 0; i < s.length(); i++) {
            int value = values.get(s.charAt(i));
            if (i + 1 < s.length() && values.get(s.charAt(i + 1)) > value) {
                total -= value;
            } else {
                total += value;
            }
        }
        return total;
    }

    public static void main(String[] args) {
        System.out.println(toRoman(1994));
        System.out.println(fromRoman("MCMXCIV"));
    }
}
