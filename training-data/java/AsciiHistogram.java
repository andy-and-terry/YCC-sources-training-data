import java.util.Map;
import java.util.TreeMap;

public class AsciiHistogram {
    static String render(String s, int width) {
        Map<Character, Integer> counts = new TreeMap<>();
        for (char c : s.toCharArray()) counts.merge(c, 1, Integer::sum);
        int peak = counts.values().stream().mapToInt(Integer::intValue).max().orElse(1);
        StringBuilder sb = new StringBuilder();
        counts.forEach((k, n) -> sb.append(k).append(" | ")
                .append("#".repeat(Math.max(1, n * width / peak))).append(' ').append(n).append('\n'));
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.print(render("theraininspainfallsmainlyontheplain", 30));
    }
}
