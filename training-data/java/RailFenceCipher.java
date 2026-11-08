public class RailFenceCipher {
    static String encode(String s, int rails) {
        StringBuilder[] rows = new StringBuilder[rails];
        for (int i = 0; i < rails; i++) rows[i] = new StringBuilder();
        int r = 0, dir = 1;
        for (char c : s.toCharArray()) {
            rows[r].append(c);
            if (r == 0) dir = 1;
            if (r == rails - 1) dir = -1;
            r += dir;
        }
        StringBuilder out = new StringBuilder();
        for (StringBuilder row : rows) out.append(row);
        return out.toString();
    }

    public static void main(String[] args) {
        System.out.println(encode("WEAREDISCOVERED", 3));
    }
}
