// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
public class ParenNestingDepth {
    static int maxDepth(String s) {
        int depth = 0, best = 0;
        for (char ch : s.toCharArray()) {
            if (ch == '(') best = Math.max(best, ++depth);
            else if (ch == ')' && --depth < 0) return -1;
        }
        return depth == 0 ? best : -1;
    }

    public static void main(String[] args) {
        System.out.println(maxDepth("(1+(2*(3)))") + " " + maxDepth("(()"));
    }
}
