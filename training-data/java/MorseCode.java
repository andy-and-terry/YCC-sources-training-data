import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class MorseCode {
    private static final String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final String[] CODES = {
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--",
        "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..",
        "-----", ".----", "..---", "...--", "....-", ".....", "-....", "--...", "---..", "----.",
    };
    private static final Map<Character, String> ENC = new HashMap<>();
    private static final Map<String, Character> DEC = new HashMap<>();

    static {
        for (int i = 0; i < LETTERS.length(); i++) {
            ENC.put(LETTERS.charAt(i), CODES[i]);
            DEC.put(CODES[i], LETTERS.charAt(i));
        }
    }

    public static String encode(String text) {
        return Arrays.stream(text.toUpperCase().trim().split("\\s+"))
                .map(w -> w.chars().mapToObj(c -> ENC.get((char) c)).filter(s -> s != null).collect(Collectors.joining(" ")))
                .collect(Collectors.joining(" / "));
    }

    public static String decode(String code) {
        return Arrays.stream(code.split(" / "))
                .map(w -> Arrays.stream(w.split(" ")).map(s -> String.valueOf(DEC.getOrDefault(s, '?'))).collect(Collectors.joining()))
                .collect(Collectors.joining(" "));
    }

    public static void main(String[] args) {
        String m = encode("SOS help 2024");
        System.out.println(m);
        System.out.println(decode(m));
    }
}
