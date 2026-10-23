// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
public class tribonacci_numbers {
    public static List<Long> tribonacci(Integer count) {
        List<Long> t = new List<Long>{ 0L, 0L, 1L };
        while (t.size() < count) {
            Integer n = t.size();
            t.add(t[n - 1] + t[n - 2] + t[n - 3]);
        }
        while (t.size() > count) {
            t.remove(t.size() - 1);
        }
        return t;
    }

    public static void run() {
        System.debug('Tribonacci: ' + String.join(tribonacci(15), ', '));
    }
}
