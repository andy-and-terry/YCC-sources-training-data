import java.util.ArrayList;
import java.util.List;

public class LuckyNumbers {
    static List<Integer> lucky(int limit) {
        List<Integer> nums = new ArrayList<>();
        for (int v = 1; v <= limit; v += 2) nums.add(v);
        for (int i = 1; i < nums.size() && nums.get(i) <= nums.size(); i++) {
            int step = nums.get(i);
            List<Integer> kept = new ArrayList<>();
            for (int idx = 0; idx < nums.size(); idx++) {
                if ((idx + 1) % step != 0) kept.add(nums.get(idx));
            }
            nums = kept;
        }
        return nums;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : lucky(50)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
