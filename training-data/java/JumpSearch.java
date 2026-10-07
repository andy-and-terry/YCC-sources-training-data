public class JumpSearch {
    public static int search(int[] a, int target) {
        int n = a.length;
        int step = Math.max(1, (int) Math.sqrt(n));
        int prev = 0;
        while (prev < n && a[Math.min(prev + step, n) - 1] < target) prev += step;
        for (int i = prev; i < Math.min(prev + step, n); i++) if (a[i] == target) return i;
        return -1;
    }

    public static void main(String[] args) {
        int[] fib = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610};
        System.out.println(search(fib, 55) + " " + search(fib, 4));
    }
}
