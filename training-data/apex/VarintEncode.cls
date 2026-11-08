public class VarintEncode {
    public static List<Integer> encode(Integer n) {
        List<Integer> out = new List<Integer>();
        while (n >= 128) {
            out.add((Math.mod(n, 128)) + 128);
            n = n / 128;
        }
        out.add(n);
        return out;
    }
}
