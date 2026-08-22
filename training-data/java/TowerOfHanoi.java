import java.util.ArrayList;
import java.util.List;

public class TowerOfHanoi {
    public static List<String> hanoi(int n, String source, String target, String auxiliary) {
        List<String> moves = new ArrayList<>();
        hanoiHelper(n, source, target, auxiliary, moves);
        return moves;
    }

    private static void hanoiHelper(int n, String source, String target, String auxiliary, List<String> moves) {
        if (n == 1) {
            moves.add(source + " -> " + target);
            return;
        }
        hanoiHelper(n - 1, source, auxiliary, target, moves);
        moves.add(source + " -> " + target);
        hanoiHelper(n - 1, auxiliary, target, source, moves);
    }

    public static void main(String[] args) {
        for (String move : hanoi(3, "A", "C", "B")) {
            System.out.println(move);
        }
    }
}
