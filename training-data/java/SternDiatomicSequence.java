public class SternDiatomicSequence {
    static int[] stern(int count) {
        int[] s = new int[count + 2];
        s[1] = 1;
        for (int i = 2; i < count; i++) {
            s[i] = i % 2 == 0 ? s[i / 2] : s[i / 2] + s[i / 2 + 1];
        }
        return java.util.Arrays.copyOf(s, count);
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : stern(20)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
