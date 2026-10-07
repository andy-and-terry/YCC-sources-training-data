public class RunLengthEncoding {
    public static String encode(String s) {
        if (String.isEmpty(s)) {
            return '';
        }
        List<String> parts = new List<String>();
        Integer count = 1;
        for (Integer i = 1; i <= s.length(); i++) {
            if (i < s.length() && s.charAt(i) == s.charAt(i - 1)) {
                count++;
            } else {
                parts.add(String.valueOf(count) + s.substring(i - 1, i));
                count = 1;
            }
        }
        return String.join(parts, '');
    }

    public static void main() {
        System.debug(encode('aaabbbccd'));
        System.debug(encode('abcd'));
    }
}
