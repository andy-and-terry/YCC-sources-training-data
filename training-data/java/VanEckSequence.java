import java.util.HashMap;
import java.util.Map;

public class VanEckSequence {
    static int[] vanEck(int count) {
        int[] seq = new int[count];
        Map<Integer, Integer> lastSeen = new HashMap<>();
        for (int i = 0; i < count - 1; i++) {
            int cur = seq[i];
            seq[i + 1] = lastSeen.containsKey(cur) ? i - lastSeen.get(cur) : 0;
            lastSeen.put(cur, i);
        }
        return seq;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : vanEck(20)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
