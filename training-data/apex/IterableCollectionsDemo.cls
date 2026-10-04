public class IterableCollectionsDemo {
    public static List<Integer> filterEven(List<Integer> input) {
        List<Integer> out = new List<Integer>();
        for (Integer n : input) {
            if (Math.mod(n, 2) == 0) out.add(n);
        }
        return out;
    }

    public static void main() {
        List<Integer> nums = new List<Integer>{ 5, 2, 8, 3, 6 };
        System.debug(filterEven(nums));
        List<Integer> copy = nums.clone();
        copy.sort();
        System.debug(copy);
        System.debug(nums.indexOf(8));
        nums.add(1, 99);
        nums.remove(0);
        System.debug(nums);
        List<Integer> rev = new List<Integer>();
        for (Integer i = nums.size() - 1; i >= 0; i--) rev.add(nums[i]);
        System.debug(rev);
        System.debug(nums.isEmpty());
    }
}
