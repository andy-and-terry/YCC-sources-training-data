import java.util.ArrayList;
import java.util.List;

public class BitCountSubsets {
    public static void main(String[] args) {
        String[] items = {"a", "b", "c", "d"};
        int target = 2;
        List<String> result = new ArrayList<>();
        for (int mask = 0; mask < (1 << items.length); mask++) {
            if (Integer.bitCount(mask) != target) continue;
            StringBuilder sb = new StringBuilder("{");
            for (int i = 0; i < items.length; i++) {
                if ((mask & (1 << i)) != 0) sb.append(items[i]);
            }
            result.add(sb.append("}").toString());
        }
        System.out.println(result);
        System.out.println(Integer.toBinaryString(42) + " leading zeros: " + Integer.numberOfLeadingZeros(42));
        System.out.println(Integer.highestOneBit(100) + " " + Integer.lowestOneBit(100));
    }
}
