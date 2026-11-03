public class SwapCaseManual {
    static String swapCase(String s) {
        StringBuilder sb = new StringBuilder();
        for (char c : s.toCharArray()) {
            sb.append(Character.isUpperCase(c) ? Character.toLowerCase(c) : Character.toUpperCase(c));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(swapCase("Hello World 42"));
    }
}
