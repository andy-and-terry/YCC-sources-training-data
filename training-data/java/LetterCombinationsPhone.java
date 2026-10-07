import java.util.ArrayList;
import java.util.List;

public class LetterCombinationsPhone {
    private static final String[] KEYS = {"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};

    public static List<String> combinations(String digits) {
        List<String> result = new ArrayList<>();
        if (digits.isEmpty()) return result;
        result.add("");
        for (char d : digits.toCharArray()) {
            List<String> next = new ArrayList<>();
            for (String prefix : result) for (char c : KEYS[d - '0'].toCharArray()) next.add(prefix + c);
            result = next;
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(combinations("23"));
        System.out.println(combinations("7979").size());
    }
}
