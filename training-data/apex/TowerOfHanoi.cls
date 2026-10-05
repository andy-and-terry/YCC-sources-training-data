public class TowerOfHanoi {
    private static Integer moves = 0;

    public static void move(Integer n, String src, String dst, String via) {
        if (n == 0) {
            return;
        }
        move(n - 1, src, via, dst);
        moves++;
        System.debug('Move disk ' + n + ' from ' + src + ' to ' + dst);
        move(n - 1, via, dst, src);
    }

    public static void main() {
        move(3, 'A', 'C', 'B');
        System.debug('Total moves: ' + moves);
    }
}
