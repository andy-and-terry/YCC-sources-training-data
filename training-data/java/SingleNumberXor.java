import java.util.Arrays;

public class SingleNumberXor {
    public static void main(String[] args) {
        int[] nums = {4, 1, 2, 1, 2};
        System.out.println(Arrays.stream(nums).reduce(0, (a, b) -> a ^ b)); // 4
    }
}
