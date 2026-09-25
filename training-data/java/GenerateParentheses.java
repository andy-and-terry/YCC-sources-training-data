import java.util.ArrayList;
import java.util.List;

public class GenerateParentheses {
    public static List<String> generate(int n) {
        List<String> out = new ArrayList<>();
        build(new char[2 * n], 0, 0, 0, n, out);
        return out;
    }

    private static void build(char[] buf, int pos, int open, int close, int n, List<String> out) {
        if (pos == buf.length) {
            out.add(new String(buf));
            return;
        }
        if (open < n) {
            buf[pos] = '(';
            build(buf, pos + 1, open + 1, close, n, out);
        }
        if (close < open) {
            buf[pos] = ')';
            build(buf, pos + 1, open, close + 1, n, out);
        }
    }

    public static void main(String[] args) {
        System.out.println(generate(3));
        System.out.println("n=8: " + generate(8).size());
    }
}
