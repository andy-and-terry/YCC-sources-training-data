public class HofstadterQSequence {
    // Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), Q(1) = Q(2) = 1
    static int[] hofstadterQ(int count) {
        int[] q = new int[count + 1];
        q[1] = 1;
        q[2] = 1;
        for (int n = 3; n <= count; n++) q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
        return q;
    }

    public static void main(String[] args) {
        int[] q = hofstadterQ(20);
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n < q.length; n++) sb.append(q[n]).append(' ');
        System.out.println(sb.toString().trim());
    }
}
