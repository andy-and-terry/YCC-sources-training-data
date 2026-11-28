public class RailFenceCipher {
    static String encode(String text, int rails) {
        StringBuilder[] rows = new StringBuilder[rails];
        for (int i = 0; i < rails; i++) rows[i] = new StringBuilder();
        int r = 0, step = 1;
        for (char ch : text.toCharArray()) {
            rows[r].append(ch);
            if (r == 0) step = 1;
            else if (r == rails - 1) step = -1;
            r += step;
        }
        StringBuilder out = new StringBuilder();
        for (StringBuilder row : rows) out.append(row);
        return out.toString();
    }

    public static void main(String[] args) {
        System.out.println(encode("WEAREDISCOVERED", 3));
    }
}
