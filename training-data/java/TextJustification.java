import java.util.ArrayList;
import java.util.List;

public class TextJustification {
    public static List<String> justify(String[] words, int width) {
        List<String> lines = new ArrayList<>();
        int i = 0;
        while (i < words.length) {
            int j = i, len = 0;
            while (j < words.length && len + words[j].length() + (j - i) <= width) len += words[j++].length();
            int gaps = j - i - 1;
            StringBuilder sb = new StringBuilder();
            if (j == words.length || gaps == 0) {
                sb.append(String.join(" ", java.util.Arrays.copyOfRange(words, i, j)));
                sb.append(" ".repeat(width - sb.length()));
            } else {
                int spaces = (width - len) / gaps, extra = (width - len) % gaps;
                for (int k = i; k < j - 1; k++) sb.append(words[k]).append(" ".repeat(spaces + (k - i < extra ? 1 : 0)));
                sb.append(words[j - 1]);
            }
            lines.add(sb.toString());
            i = j;
        }
        return lines;
    }

    public static void main(String[] args) {
        String[] words = "This is an example of text justification done greedily line by line".split(" ");
        justify(words, 20).forEach(l -> System.out.println("[" + l + "]"));
    }
}
