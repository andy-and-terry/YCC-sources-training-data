import java.net.URI;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;

public class UrlParser {
    record ParsedUrl(String scheme, String userInfo, String host, int port, String path, Map<String, String> query, String fragment) {}

    public static ParsedUrl parse(String url) {
        URI uri = URI.create(url);
        int port = uri.getPort();
        if (port < 0) {
            port = switch (uri.getScheme().toLowerCase()) {
                case "http" -> 80;
                case "https" -> 443;
                case "ftp" -> 21;
                default -> -1;
            };
        }
        Map<String, String> query = new LinkedHashMap<>();
        Optional.ofNullable(uri.getRawQuery()).ifPresent(q -> {
            for (String pair : q.split("&")) {
                if (pair.isEmpty()) continue;
                String[] kv = pair.split("=", 2);
                query.put(decode(kv[0]), kv.length > 1 ? decode(kv[1]) : "");
            }
        });
        String path = uri.getPath() == null || uri.getPath().isEmpty() ? "/" : uri.getPath();
        return new ParsedUrl(uri.getScheme(), uri.getUserInfo(), uri.getHost(), port, path, query, uri.getFragment());
    }

    private static String decode(String s) {
        return URLDecoder.decode(s, StandardCharsets.UTF_8);
    }

    public static void main(String[] args) {
        System.out.println(parse("https://user:pw@example.com:8443/a/b?x=1&y=hello%20world#top"));
        System.out.println(parse("http://localhost"));
    }
}
