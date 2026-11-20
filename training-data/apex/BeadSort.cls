// Bead (gravity) sort.
public class BeadSort {
    public static List<Integer> sort(List<Integer> nums) {
        Integer mx = 0;
        for (Integer n : nums) { if (n > mx) mx = n; }
        List<Integer> cols = new List<Integer>();
        for (Integer i = 1; i <= mx; i++) {
            Integer c = 0;
            for (Integer n : nums) { if (n >= i) c++; }
            cols.add(c);
        }
        List<Integer> rows = new List<Integer>();
        for (Integer r = 1; r <= nums.size(); r++) {
            Integer c = 0;
            for (Integer v : cols) { if (v >= r) c++; }
            rows.add(0, c);
        }
        return rows;
    }
}
