public class RunLengthEncode {
    public static String encode(String s) {
        if (s.isEmpty()) return "";
        StringBuilder result = new StringBuilder();
        int count = 1;
        for (int i = 1; i <= s.length(); i++) {
            if (i < s.length() && s.charAt(i) == s.charAt(i - 1)) {
                count++;
            } else {
                result.append(s.charAt(i - 1)).append(count);
                count = 1;
            }
        }
        return result.toString();
    }

    public static String decode(String s) {
        StringBuilder result = new StringBuilder();
        int i = 0;
        while (i < s.length()) {
            char ch = s.charAt(i);
            int j = i + 1;
            while (j < s.length() && Character.isDigit(s.charAt(j))) j++;
            int count = Integer.parseInt(s.substring(i + 1, j));
            for (int k = 0; k < count; k++) result.append(ch);
            i = j;
        }
        return result.toString();
    }

    public static void main(String[] args) {
        String encoded = encode("aaabbbccd");
        System.out.println(encoded);
        System.out.println(decode(encoded));
    }
}
