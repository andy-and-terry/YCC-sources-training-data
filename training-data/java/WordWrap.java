import java.util.ArrayList;
import java.util.List;

public class WordWrap {
    public static List<String> wrap(String text, int width) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.trim().split("\\s+")) {
            while (word.length() > width) {
                if (line.length() > 0) {
                    lines.add(line.toString());
                    line.setLength(0);
                }
                lines.add(word.substring(0, width));
                word = word.substring(width);
            }
            if (line.length() == 0) {
                line.append(word);
            } else if (line.length() + 1 + word.length() <= width) {
                line.append(' ').append(word);
            } else {
                lines.add(line.toString());
                line.setLength(0);
                line.append(word);
            }
        }
        if (line.length() > 0) lines.add(line.toString());
        return lines;
    }

    public static void main(String[] args) {
        String text = "The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically";
        for (String l : wrap(text, 16)) System.out.printf("|%-16s|%n", l);
    }
}
