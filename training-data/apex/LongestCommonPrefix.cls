public class LongestCommonPrefix {
    public static String find(List<String> words) {
        if (words == null || words.isEmpty()) {
            return '';
        }
        String prefix = words[0];
        for (Integer i = 1; i < words.size(); i++) {
            while (!words[i].startsWith(prefix)) {
                prefix = prefix.substring(0, prefix.length() - 1);
                if (prefix.length() == 0) {
                    return '';
                }
            }
        }
        return prefix;
    }

    public static void main() {
        System.debug(find(new List<String>{ 'flower', 'flow', 'flight' }));
        System.debug(find(new List<String>{ 'dog', 'racecar', 'car' }));
    }
}
