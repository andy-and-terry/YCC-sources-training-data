public class RomanNumerals {
    public static String toRoman(Integer num) {
        List<Integer> values = new List<Integer>{1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        List<String> symbols = new List<String>{'M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'};
        String result = '';
        for (Integer i = 0; i < values.size(); i++) {
            while (num >= values[i]) {
                result += symbols[i];
                num -= values[i];
            }
        }
        return result;
    }

    public static void main() {
        System.debug(toRoman(1994));
    }
}
