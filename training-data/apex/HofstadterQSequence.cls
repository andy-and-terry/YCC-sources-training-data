public class HofstadterQSequence {
    // Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
    public static List<Integer> hofstadterQ(Integer count) {
        List<Integer> q = new List<Integer>{ 0, 1, 1 }; // index 0 unused
        for (Integer n = 3; n <= count; n++) {
            q.add(q[n - q[n - 1]] + q[n - q[n - 2]]);
        }
        q.remove(0);
        return q;
    }

    public static void main() {
        System.debug(hofstadterQ(20));
    }
}
