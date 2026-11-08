public class HanoiMoveList {
    public static void hanoi(Integer n, String a, String b, String c, List<String> out) {
        if (n == 0) return;
        hanoi(n - 1, a, c, b, out);
        out.add(a + '->' + c);
        hanoi(n - 1, b, a, c, out);
    }

    public static List<String> solve(Integer n) {
        List<String> moves = new List<String>();
        hanoi(n, 'A', 'B', 'C', moves);
        return moves;
    }
}
