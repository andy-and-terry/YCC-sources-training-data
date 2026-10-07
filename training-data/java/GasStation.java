public class GasStation {
    public static int start(int[] gas, int[] cost) {
        int total = 0, tank = 0, start = 0;
        for (int i = 0; i < gas.length; i++) {
            int diff = gas[i] - cost[i];
            total += diff;
            tank += diff;
            if (tank < 0) {
                start = i + 1;
                tank = 0;
            }
        }
        return total < 0 ? -1 : start;
    }

    public static void main(String[] args) {
        System.out.println(start(new int[] {1, 2, 3, 4, 5}, new int[] {3, 4, 5, 1, 2}) + " " + start(new int[] {2, 3, 4}, new int[] {3, 4, 3}));
    }
}
