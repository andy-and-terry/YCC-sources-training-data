public class InterpolationSearch {
    public static int search(int[] a, int target) {
        int lo = 0, hi = a.length - 1;
        while (lo <= hi && target >= a[lo] && target <= a[hi]) {
            if (a[hi] == a[lo]) return a[lo] == target ? lo : -1;
            int pos = lo + (int) ((long) (target - a[lo]) * (hi - lo) / (a[hi] - a[lo]));
            if (a[pos] == target) return pos;
            if (a[pos] < target) lo = pos + 1;
            else hi = pos - 1;
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] data = {10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47};
        System.out.println(search(data, 18) + " " + search(data, 25));
    }
}
