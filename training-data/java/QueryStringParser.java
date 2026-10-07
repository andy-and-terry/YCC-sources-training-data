import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class QueryStringParser {
    public static Map<String, List<String>> parse(String qs) {
        Map<String, List<String>> out = new LinkedHashMap<>();
        if (qs.startsWith("?")) qs = qs.substring(1);
        for (String pair : qs.split("&")) {
            if (pair.isEmpty()) continue;
            int eq = pair.indexOf('=');
            String key = URLDecoder.decode(eq < 0 ? pair : pair.substring(0, eq), StandardCharsets.UTF_8);
            String val = eq < 0 ? "" : URLDecoder.decode(pair.substring(eq + 1), StandardCharsets.UTF_8);
            out.computeIfAbsent(key, k -> new ArrayList<>()).add(val);
        }
        return out;
    }

    public static String build(Map<String, List<String>> params) {
        return params.entrySet().stream()
                .flatMap(e -> e.getValue().stream().map(v -> enc(e.getKey()) + "=" + enc(v)))
                .collect(Collectors.joining("&"));
    }

    private static String enc(String s) {
        return URLEncoder.encode(s, StandardCharsets.UTF_8);
    }

    public static void main(String[] args) {
        Map<String, List<String>> q = parse("?name=J%C3%BCrgen+M&tag=a&tag=b&empty=");
        System.out.println(q);
        System.out.println(build(q));
    }
}
