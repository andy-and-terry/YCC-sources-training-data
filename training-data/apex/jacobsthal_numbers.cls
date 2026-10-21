// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
public class JacobsthalNumbers {
    public static List<Long> terms(Integer count) {
        List<Long> result = new List<Long>();
        Long a = 0;
        Long b = 1;
        for (Integer i = 0; i < count; i++) {
            result.add(a);
            Long next = b + 2 * a;
            a = b;
            b = next;
        }
        return result;
    }

    public static void run() {
        System.debug(String.join(terms(15), ' '));
    }
}
