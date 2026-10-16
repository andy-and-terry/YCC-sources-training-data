public class StackViaListUsage {
    public static Boolean isBalanced(String text) {
        List<String> stack = new List<String>();
        Map<String, String> pairs = new Map<String, String>{ ')' => '(', ']' => '[', '}' => '{' };
        for (String ch : text.split('')) {
            if (pairs.values().contains(ch)) {
                stack.add(ch);
            } else if (pairs.containsKey(ch)) {
                if (stack.isEmpty() || stack.remove(stack.size() - 1) != pairs.get(ch)) {
                    return false;
                }
            }
        }
        return stack.isEmpty();
    }

    public static void main() {
        System.debug(isBalanced('{[()]}'));
        System.debug(isBalanced('{[(])}'));
    }
}
