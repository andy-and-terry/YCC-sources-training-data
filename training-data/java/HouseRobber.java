public class HouseRobber {
    public static int rob(int[] houses, int from, int to) {
        int take = 0, skip = 0;
        for (int i = from; i < to; i++) {
            int newTake = skip + houses[i];
            skip = Math.max(take, skip);
            take = newTake;
        }
        return Math.max(take, skip);
    }

    public static int robLine(int[] houses) {
        return rob(houses, 0, houses.length);
    }

    public static int robCircle(int[] houses) {
        if (houses.length == 1) return houses[0];
        return Math.max(rob(houses, 0, houses.length - 1), rob(houses, 1, houses.length));
    }

    public static void main(String[] args) {
        System.out.println(robLine(new int[] {2, 7, 9, 3, 1}) + " " + robCircle(new int[] {2, 3, 2}) + " " + robCircle(new int[] {1, 2, 3, 1}));
    }
}
