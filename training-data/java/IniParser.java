import java.util.LinkedHashMap;
import java.util.Map;

public class IniParser {
    public static Map<String, Map<String, String>> parse(String text) {
        Map<String, Map<String, String>> result = new LinkedHashMap<>();
        String section = null;
        for (String rawLine : text.split("\n")) {
            String line = rawLine.trim();
            if (line.isEmpty() || line.startsWith("#") || line.startsWith(";")) continue;
            if (line.startsWith("[") && line.endsWith("]")) {
                section = line.substring(1, line.length() - 1);
                result.put(section, new LinkedHashMap<>());
            } else if (line.contains("=") && section != null) {
                String[] parts = line.split("=", 2);
                result.get(section).put(parts[0].trim(), parts[1].trim());
            }
        }
        return result;
    }

    public static void main(String[] args) {
        String sample = "\n[server]\nhost = localhost\nport = 8080\n";
        System.out.println(parse(sample));
    }
}
