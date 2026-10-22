import java.util.ArrayList;
import java.util.List;

public class KolakoskiSequence {
    static List<Integer> kolakoski(int count) {
        List<Integer> seq = new ArrayList<>(List.of(1, 2, 2));
        for (int i = 2; seq.size() < count; i++) {
            int value = 3 - seq.get(seq.size() - 1);
            for (int k = 0; k < seq.get(i); k++) seq.add(value);
        }
        return seq.subList(0, count);
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : kolakoski(20)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
