public class MoserDeBruijn {
    static long moserDeBruijn(int i) {
        long value = 0, power = 1;
        for (; i > 0; i >>= 1) {
            if ((i & 1) == 1) value += power;
            power *= 4;
        }
        return value;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 10; i++) sb.append(moserDeBruijn(i)).append(' ');
        System.out.println(sb.toString().trim()); // 0 1 4 5 16 17 20 21 64 65
    }
}
