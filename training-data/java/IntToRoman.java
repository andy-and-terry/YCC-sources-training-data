// Integer (1..3999) to Roman numeral using a greedy table.
public class IntToRoman {
    static final int[] VALUES = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    static final String[] SYMBOLS = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};

    static String toRoman(int n) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < VALUES.length; i++)
            while (n >= VALUES[i]) { sb.append(SYMBOLS[i]); n -= VALUES[i]; }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(toRoman(1994) + " " + toRoman(58));
    }
}
