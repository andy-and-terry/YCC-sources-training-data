public class FibonacciSearch {
    public static int search(int[] a, int target) {
        int n = a.length;
        int f2 = 0, f1 = 1, f = 1;
        while (f < n) {
            f2 = f1;
            f1 = f;
            f = f1 + f2;
        }
        int offset = -1;
        while (f > 1) {
            int i = Math.min(offset + f2, n - 1);
            if (a[i] < target) {
                f = f1; f1 = f2; f2 = f - f1; offset = i;
            } else if (a[i] > target) {
                f = f2; f1 = f1 - f2; f2 = f - f1;
            } else {
                return i;
            }
        }
        return (f1 == 1 && offset + 1 < n && a[offset + 1] == target) ? offset + 1 : -1;
    }

    public static void main(String[] args) {
        int[] data = {10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100};
        for (int t : new int[] {85, 10, 100, 7}) System.out.println(t + " " + search(data, t));
    }
}
