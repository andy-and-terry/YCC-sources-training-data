public class OddCubesIdentity {
    static long cubeFromOdds(long n) {
        long start = n * n - n + 1, sum = 0;
        for (long i = 0; i < n; i++) sum += start + 2 * i;
        return sum;
    }

    public static void main(String[] args) {
        for (long n = 1; n <= 5; n++)
            System.out.println(n + " " + cubeFromOdds(n) + " " + (cubeFromOdds(n) == n * n * n));
    }
}
