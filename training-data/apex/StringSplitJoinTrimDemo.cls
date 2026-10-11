public class StringSplitJoinTrimDemo {
    public static List<String> parseCsvLine(String line) {
        List<String> parts = line.split(',');
        for (Integer i = 0; i < parts.size(); i++) {
            parts[i] = parts[i].trim();
        }
        return parts;
    }

    public static void main() {
        List<String> cells = parseCsvLine(' red , green,blue ,  ');
        System.debug(cells.size());
        System.debug(String.join(cells, '|'));
    }
}
