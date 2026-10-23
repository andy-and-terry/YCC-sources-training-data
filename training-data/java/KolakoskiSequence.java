public class KolakoskiSequence {
    static int[] kolakoski(int count) {
        int[] seq = new int[count + 3];
        seq[0] = 1;
        seq[1] = 2;
        seq[2] = 2;
        int len = 3;
        for (int i = 2; len < count; i++) {
            int value = seq[len - 1] == 2 ? 1 : 2;
            for (int k = 0; k < seq[i]; k++) seq[len++] = value;
        }
        return java.util.Arrays.copyOf(seq, count);
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : kolakoski(20)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
