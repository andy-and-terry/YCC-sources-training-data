import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class PigLatin {
    private static final Pattern WORD = Pattern.compile("(?i)^(qu|[^aeiou]*)(.*)$");

    public static String word(String w) {
        Matcher m = WORD.matcher(w);
        if (!m.matches()) return w;
        String head = m.group(1), rest = m.group(2);
        if (head.isEmpty()) return w + "way";
        if (rest.isEmpty()) return w + "ay";
        return rest + head + "ay";
    }

    public static String sentence(String s) {
        return Arrays.stream(s.split("\\s+")).map(PigLatin::word).collect(Collectors.joining(" "));
    }

    public static void main(String[] args) {
        System.out.println(sentence("the quick brown fox jumps over the lazy dog"));
    }
}
