public class VigenereCipher {
    private final String key;

    public VigenereCipher(String key) {
        this.key = key.toLowerCase().replaceAll("[^a-z]", "");
        if (this.key.isEmpty()) throw new IllegalArgumentException("key must contain letters");
    }

    private String shift(String text, int dir) {
        StringBuilder sb = new StringBuilder(text.length());
        int k = 0;
        for (char c : text.toCharArray()) {
            if (Character.isLetter(c) && c < 128) {
                char base = Character.isUpperCase(c) ? 'A' : 'a';
                int s = key.charAt(k++ % key.length()) - 'a';
                sb.append((char) (base + Math.floorMod(c - base + dir * s, 26)));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public String encrypt(String plain) { return shift(plain, 1); }
    public String decrypt(String cipher) { return shift(cipher, -1); }

    public static void main(String[] args) {
        VigenereCipher v = new VigenereCipher("LEMON");
        String c = v.encrypt("Attack at dawn!");
        System.out.println(c + " -> " + v.decrypt(c));
    }
}
