public class SwapCaseManual {
    public static String swapCase(String s) {
        String out = '';
        for (Integer i = 0; i < s.length(); i++) {
            String c = s.substring(i, i + 1);
            out += (c == c.toUpperCase() && c != c.toLowerCase()) ? c.toLowerCase() : c.toUpperCase();
        }
        return out;
    }

    public static void demo() {
        System.debug(swapCase('Hello World 42'));
    }
}
