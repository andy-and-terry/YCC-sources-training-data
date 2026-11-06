// Integer (1..3999) to Roman numeral using a greedy table.
public class IntToRoman {
    static final List<Integer> VALUES = new List<Integer>{ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
    static final List<String> SYMBOLS = new List<String>{ 'M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I' };

    public static String toRoman(Integer n) {
        String out = '';
        for (Integer i = 0; i < VALUES.size(); i++) {
            while (n >= VALUES[i]) {
                out += SYMBOLS[i];
                n -= VALUES[i];
            }
        }
        return out;
    }

    public static void run() {
        System.debug(toRoman(1994) + ' ' + toRoman(58));
    }
}
