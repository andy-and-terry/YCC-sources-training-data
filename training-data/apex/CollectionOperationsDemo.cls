public class CollectionOperationsDemo {
    public static void main() {
        List<Integer> nums = new List<Integer>{1, 2, 3, 4, 5};
        Set<Integer> uniqueNums = new Set<Integer>(nums);
        Map<Integer, Integer> squares = new Map<Integer, Integer>();
        for (Integer n : nums) {
            squares.put(n, n * n);
        }
        System.debug(uniqueNums);
        System.debug(squares);
    }
}
