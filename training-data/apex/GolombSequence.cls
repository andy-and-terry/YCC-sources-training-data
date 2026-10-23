public class GolombSequence {
    // G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
    public static List<Integer> golomb(Integer count) {
        List<Integer> g = new List<Integer>{ 0, 1 }; // index 0 unused
        for (Integer n = 2; n <= count; n++) {
            g.add(1 + g[n - g[g[n - 1]]]);
        }
        g.remove(0);
        return g;
    }

    public static void main() {
        System.debug(golomb(20));
    }
}
