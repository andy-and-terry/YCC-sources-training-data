public class EggDrop {
    /** Highest floor count solvable with e eggs and m moves: f(e, m) = f(e-1, m-1) + f(e, m-1) + 1. */
    public static int minMoves(int eggs, long floors) {
        long[] f = new long[eggs + 1];
        int moves = 0;
        while (f[eggs] < floors) {
            moves++;
            for (int e = eggs; e > 0; e--) f[e] = f[e] + f[e - 1] + 1;
        }
        return moves;
    }

    public static void main(String[] args) {
        System.out.println(minMoves(1, 10) + " " + minMoves(2, 100) + " " + minMoves(3, 1000) + " " + minMoves(10, 1_000_000_000L));
    }
}
