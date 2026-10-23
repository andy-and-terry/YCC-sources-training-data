public class Soundex {
    private static final String CODES = "01230120022455012623010202";

    public static String soundex(String word) {
        String w = word.toUpperCase();
        StringBuilder out = new StringBuilder().append(w.charAt(0));
        char last = CODES.charAt(w.charAt(0) - 'A');
        for (int i = 1; i < w.length() && out.length() < 4; i++) {
            char ch = w.charAt(i);
            char code = CODES.charAt(ch - 'A');
            if (code != '0' && code != last) out.append(code);
            if (ch != 'H' && ch != 'W') last = code;
        }
        while (out.length() < 4) out.append('0');
        return out.toString();
    }

    public static void main(String[] args) {
        for (String n : new String[] {"Robert", "Rupert", "Tymczak", "Pfister", "Honeyman"}) {
            System.out.println(n + " -> " + soundex(n));
        }
    }
}
