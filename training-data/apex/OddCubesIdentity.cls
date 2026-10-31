public class OddCubesIdentity {
    public static Long cubeFromOdds(Long n) {
        Long start = n * n - n + 1;
        Long total = 0;
        for (Long i = 0; i < n; i++) {
            total += start + 2 * i;
        }
        return total;
    }

    public static void main() {
        for (Long n = 1; n <= 5; n++) {
            System.debug(n + ' ' + cubeFromOdds(n) + ' ' + (cubeFromOdds(n) == n * n * n));
        }
    }
}
