// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
public class PadovanSequence {
    public static List<Integer> padovan(Integer count) {
        List<Integer> p = new List<Integer>();
        for (Integer i = 0; i < count; i++) {
            p.add(i < 3 ? 1 : p[i - 2] + p[i - 3]);
        }
        return p;
    }

    public static void run() {
        System.debug(String.join(padovan(15), ' '));
    }
}
