import java.util.ArrayList;
import java.util.List;

public class StringChunking {
    static List<String> chunk(String s, int size) {
        List<String> parts = new ArrayList<>();
        for (int i = 0; i < s.length(); i += size) {
            parts.add(s.substring(i, Math.min(s.length(), i + size)));
        }
        return parts;
    }

    public static void main(String[] args) {
        System.out.println(chunk("abcdefghij", 3));
        System.out.println(chunk("", 3));
        System.out.println(String.join("-", "1234567890".split("(?<=\\G...)")));
        System.out.println("a1b22c333".replaceAll("[0-9]+", "#"));
    }
}
