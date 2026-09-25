import java.util.Map;
import java.util.function.UnaryOperator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TemplateRender {
    private static final Pattern TOKEN = Pattern.compile("\\{\\{\\s*([\\w.]+)\\s*(?:\\|\\s*(\\w+)\\s*)?}}");
    private static final Map<String, UnaryOperator<String>> FILTERS = Map.of(
            "upper", String::toUpperCase,
            "lower", String::toLowerCase,
            "trim", String::strip);

    @SuppressWarnings("unchecked")
    private static Object lookup(Map<String, Object> ctx, String path) {
        Object cur = ctx;
        for (String part : path.split("\\.")) {
            if (!(cur instanceof Map<?, ?> m)) return null;
            cur = ((Map<String, Object>) m).get(part);
        }
        return cur;
    }

    public static String render(String template, Map<String, Object> ctx) {
        Matcher m = TOKEN.matcher(template);
        StringBuilder sb = new StringBuilder();
        while (m.find()) {
            String value = String.valueOf(lookup(ctx, m.group(1)));
            if (m.group(2) != null) {
                UnaryOperator<String> f = FILTERS.get(m.group(2));
                if (f == null) throw new IllegalArgumentException("unknown filter " + m.group(2));
                value = f.apply(value);
            }
            m.appendReplacement(sb, Matcher.quoteReplacement(value));
        }
        m.appendTail(sb);
        return sb.toString();
    }

    public static void main(String[] args) {
        Map<String, Object> ctx = Map.of("user", Map.of("name", "  Ada Lovelace "), "count", 3, "kind", "messages");
        System.out.println(render("Hello {{ user.name | trim }}, you have {{count}} new {{ kind|upper }}.", ctx));
    }
}
