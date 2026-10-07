import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TokenizerLexer {
    enum Kind { NUMBER, STRING, IDENT, KEYWORD, OP }

    record Token(Kind kind, String text, int line, int col) {}

    private static final Pattern MASTER = Pattern.compile(
            "(?<NUMBER>\\d+(?:\\.\\d+)?)|(?<STRING>\"(?:[^\"\\\\]|\\\\.)*\")|(?<IDENT>[A-Za-z_]\\w*)"
            + "|(?<OP>==|!=|<=|>=|&&|\\|\\||[+\\-*/=<>(){};,!])|(?<NL>\\n)|(?<WS>[ \\t]+|//[^\\n]*)");
    private static final Set<String> KEYWORDS = Set.of("int", "if", "else", "while", "return", "void");

    public static List<Token> tokenize(String src) {
        List<Token> out = new ArrayList<>();
        Matcher m = MASTER.matcher(src);
        int line = 1, lineStart = 0, pos = 0;
        while (pos < src.length()) {
            if (!m.find(pos) || m.start() != pos) {
                throw new IllegalArgumentException("unexpected '" + src.charAt(pos) + "' at " + line + ":" + (pos - lineStart + 1));
            }
            int col = pos - lineStart + 1;
            pos = m.end();
            if (m.group("NL") != null) {
                line++;
                lineStart = pos;
            } else if (m.group("WS") == null) {
                Kind k = m.group("NUMBER") != null ? Kind.NUMBER
                        : m.group("STRING") != null ? Kind.STRING
                        : m.group("OP") != null ? Kind.OP
                        : KEYWORDS.contains(m.group()) ? Kind.KEYWORD : Kind.IDENT;
                out.add(new Token(k, m.group(), line, col));
            }
        }
        return out;
    }

    public static void main(String[] args) {
        String code = "int x = 3.5 * (y + 2); // note\nif (x >= 10 && ok) { print(\"big\"); }";
        tokenize(code).forEach(t -> System.out.printf("%d:%-3d %-8s %s%n", t.line(), t.col(), t.kind(), t.text()));
    }
}
