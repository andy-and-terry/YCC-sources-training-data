public class SingleNumberXor {
    // Apex has no bitwise XOR operator, so emulate it with arithmetic on bits.
    private static Integer xor(Integer a, Integer b) {
        Integer result = 0, bit = 1;
        while (a > 0 || b > 0) {
            if (Math.mod(a, 2) != Math.mod(b, 2)) result += bit;
            a /= 2; b /= 2; bit *= 2;
        }
        return result;
    }

    public static Integer find(List<Integer> nums) {
        Integer acc = 0;
        for (Integer n : nums) acc = xor(acc, n);
        return acc;
    }

    public static void demo() {
        System.debug(find(new List<Integer>{4, 1, 2, 1, 2})); // 4
    }
}
