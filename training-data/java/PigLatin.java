import java.util.Arrays;
import java.util.stream.Collectors;

public class PigLatin {
    static boolean vowel(char c) { return "aeiou".indexOf(c) >= 0; }

    static String word(String w) {
        if (vowel(w.charAt(0)) || w.startsWith("xr") || w.startsWith("yt")) return w + "ay";
        for (int i = 1; i < w.length(); i++) {
            char c = w.charAt(i);
            if (c == 'u' && w.charAt(i - 1) == 'q') return w.substring(i + 1) + w.substring(0, i + 1) + "ay";
            if (vowel(c) || c == 'y') return w.substring(i) + w.substring(0, i) + "ay";
        }
        return w + "ay";
    }

    static String translate(String s) {
        return Arrays.stream(s.toLowerCase().split("\\s+")).map(PigLatin::word).collect(Collectors.joining(" "));
    }

    public static void main(String[] args) {
        System.out.println(translate("quick fast run apple rhythm square"));
    }
}
