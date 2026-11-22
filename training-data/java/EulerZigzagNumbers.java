import java.util.ArrayList;
import java.util.List;

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
public class EulerZigzagNumbers {
    public static void main(String[] args) {
        List<Long> row = new ArrayList<>(List.of(1L));
        StringBuilder sb = new StringBuilder("1 ");
        for (int i = 0; i < 9; i++) {
            List<Long> next = new ArrayList<>(List.of(0L));
            for (int j = row.size() - 1; j >= 0; j--) next.add(next.get(next.size() - 1) + row.get(j));
            row = next;
            sb.append(row.get(row.size() - 1)).append(' ');
        }
        System.out.println(sb.toString().trim());
    }
}
