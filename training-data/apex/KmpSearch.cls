public class KmpSearch {
    private static List<Integer> buildTable(String pattern) {
        List<Integer> table = new List<Integer>();
        for (Integer i = 0; i < pattern.length(); i++) table.add(0);
        Integer len = 0;
        Integer i = 1;
        while (i < pattern.length()) {
            if (pattern.substring(i, i + 1) == pattern.substring(len, len + 1)) {
                len++;
                table[i] = len;
                i++;
            } else if (len != 0) {
                len = table[len - 1];
            } else {
                table[i] = 0;
                i++;
            }
        }
        return table;
    }

    public static Integer search(String text, String pattern) {
        List<Integer> table = buildTable(pattern);
        Integer i = 0, j = 0;
        while (i < text.length()) {
            if (text.substring(i, i + 1) == pattern.substring(j, j + 1)) {
                i++;
                j++;
                if (j == pattern.length()) {
                    return i - j;
                }
            } else if (j != 0) {
                j = table[j - 1];
            } else {
                i++;
            }
        }
        return -1;
    }

    public static void main() {
        System.debug(search('ABABDABACDABABCABAB', 'ABABCABAB'));
    }
}
