public class ExcelColumnTitle {
    private static final String LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    public static String title(Integer n) {
        String result = '';
        while (n > 0) {
            n--;
            Integer r = Math.mod(n, 26);
            result = LETTERS.substring(r, r + 1) + result;
            n = n / 26;
        }
        return result;
    }

    public static void demo() {
        System.debug(title(28) + ' ' + title(701)); // AB ZY
    }
}
