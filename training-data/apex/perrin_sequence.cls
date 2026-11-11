// Perrin sequence P(n)=P(n-2)+P(n-3)
public class PerrinSequence {
    public static void run() {
        List<Integer> v = new List<Integer>{ 3, 0, 2 };
        for (Integer i = 3; i < 10; i++) {
            v.add(v[i - 2] + v[i - 3]);
        }
        System.debug(String.join(v, ' '));
    }
}
