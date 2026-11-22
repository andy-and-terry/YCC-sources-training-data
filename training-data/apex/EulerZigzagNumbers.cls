// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
public class EulerZigzagNumbers {
    public static void run() {
        List<Long> row = new List<Long>{ 1 };
        List<Long> out = new List<Long>{ 1 };
        for (Integer i = 0; i < 9; i++) {
            List<Long> next = new List<Long>{ 0 };
            for (Integer j = row.size() - 1; j >= 0; j--) {
                next.add(next[next.size() - 1] + row[j]);
            }
            row = next;
            out.add(row[row.size() - 1]);
        }
        System.debug(String.join(out, ' '));
    }
}
