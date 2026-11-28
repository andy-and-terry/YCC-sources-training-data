public class ManhattanDistance {
    static int manhattan(int[] a, int[] b) {
        int s = 0;
        for (int i = 0; i < a.length; i++) s += Math.abs(a[i] - b[i]);
        return s;
    }

    public static void main(String[] args) {
        System.out.println(manhattan(new int[]{1, 2}, new int[]{4, 6}));
    }
}
