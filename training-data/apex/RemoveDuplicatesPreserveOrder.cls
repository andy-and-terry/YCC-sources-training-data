public class RemoveDuplicatesPreserveOrder {
    public static List<String> dedupe(List<String> input) {
        Set<String> seen = new Set<String>();
        List<String> result = new List<String>();
        for (String s : input) {
            if (seen.add(s)) {
                result.add(s);
            }
        }
        return result;
    }

    public static void main() {
        System.debug(dedupe(new List<String>{ 'b', 'a', 'b', 'c', 'a' }));
    }
}
