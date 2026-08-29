public class ValidParentheses {
    public static Boolean isValid(String s) {
        List<String> stack = new List<String>();
        Map<String, String> pairs = new Map<String, String>{')' => '(', ']' => '[', '}' => '{'};
        for (Integer i = 0; i < s.length(); i++) {
            String c = s.substring(i, i + 1);
            if (c == '(' || c == '[' || c == '{') {
                stack.add(c);
            } else {
                if (stack.isEmpty() || stack[stack.size() - 1] != pairs.get(c)) {
                    return false;
                }
                stack.remove(stack.size() - 1);
            }
        }
        return stack.isEmpty();
    }

    public static void main() {
        System.debug(isValid('([{}])'));
        System.debug(isValid('([)]'));
    }
}
