// Population count (number of set bits) for 0..15
public class PopcountTable {
    public static Integer bits(Integer n) {
        Integer count = 0;
        while (n > 0) {
            count += Math.mod(n, 2);
            n = n / 2;
        }
        return count;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 0; n < 16; n++) {
            out.add(bits(n));
        }
        System.debug(String.join(out, ' '));
    }
}
