public class SkipList {
    // A simplified single-level "express lane" skip list: a sorted
    // top-level index of every 4th element used to narrow the scan
    // before falling back to a linear search of the base list.
    private List<Integer> data = new List<Integer>();
    private static final Integer STEP = 4;

    public void insert(Integer value) {
        Integer idx = 0;
        while (idx < data.size() && data[idx] < value) {
            idx++;
        }
        data.add(idx, value);
    }

    public Boolean contains(Integer target) {
        Integer i = 0;
        while (i < data.size() && data[i] < target) {
            i = Math.min(i + STEP, data.size());
            if (i > 0 && i <= data.size() && data[Math.min(i, data.size() - 1)] >= target) {
                break;
            }
        }
        Integer start = Math.max(0, i - STEP);
        for (Integer j = start; j < data.size(); j++) {
            if (data[j] == target) {
                return true;
            }
            if (data[j] > target) {
                return false;
            }
        }
        return false;
    }

    public static void main() {
        SkipList list = new SkipList();
        for (Integer v : new List<Integer>{5, 1, 9, 3, 7, 2, 8}) {
            list.insert(v);
        }
        System.debug(list.contains(7));
        System.debug(list.contains(4));
    }
}
