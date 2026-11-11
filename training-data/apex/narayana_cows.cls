// Narayana's cows N(n)=N(n-1)+N(n-3)
public class NarayanaCows {
    public static void run() {
        List<Integer> v = new List<Integer>{ 1, 1, 1 };
        for (Integer i = 3; i < 10; i++) {
            v.add(v[i - 1] + v[i - 3]);
        }
        System.debug(String.join(v, ' '));
    }
}
