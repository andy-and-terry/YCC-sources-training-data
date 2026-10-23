public class RunLengthEncoding {
    static String encode(String s) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); ) {
            int j = i;
            while (j < s.length() && s.charAt(j) == s.charAt(i)) j++;
            sb.append(j - i).append(s.charAt(i));
            i = j;
        }
        return sb.toString();
    }

    static String decode(String s) {
        StringBuilder sb = new StringBuilder();
        int count = 0;
        for (char ch : s.toCharArray()) {
            if (Character.isDigit(ch)) {
                count = count * 10 + (ch - '0');
            } else {
                sb.append(String.valueOf(ch).repeat(count));
                count = 0;
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String text = "WWWWWWBBBWWCDDDDD";
        String enc = encode(text);
        System.out.println(enc);
        System.out.println(decode(enc).equals(text));
    }
}
