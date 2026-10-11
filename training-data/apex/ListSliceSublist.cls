public class ListSliceSublist {
    public static List<Integer> slice(List<Integer> src, Integer start, Integer endExclusive) {
        List<Integer> out = new List<Integer>();
        for (Integer i = start; i < endExclusive && i < src.size(); i++) {
            out.add(src[i]);
        }
        return out;
    }

    public static void main() {
        List<Integer> nums = new List<Integer>{ 10, 20, 30, 40, 50 };
        System.debug(slice(nums, 1, 4));
        System.debug(nums.clone().remove(0));
    }
}
