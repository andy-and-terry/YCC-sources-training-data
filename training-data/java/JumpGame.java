public class JumpGame {
    public static boolean canReachEnd(int[] nums) {
        int last = nums.length - 1;
        for (int i = nums.length - 2; i >= 0; i--) if (i + nums[i] >= last) last = i;
        return last == 0;
    }

    public static int minJumps(int[] nums) {
        int jumps = 0, end = 0, far = 0;
        for (int i = 0; i < nums.length - 1; i++) {
            far = Math.max(far, i + nums[i]);
            if (i == end) {
                if (far == i) return -1;
                jumps++;
                end = far;
            }
        }
        return jumps;
    }

    public static void main(String[] args) {
        System.out.println(canReachEnd(new int[] {2, 3, 1, 1, 4}) + " " + canReachEnd(new int[] {3, 2, 1, 0, 4}));
        System.out.println(minJumps(new int[] {2, 3, 1, 1, 4}) + " " + minJumps(new int[] {3, 2, 1, 0, 4}));
    }
}
