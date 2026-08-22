public class Fibonacci {
    public static List<Long> generate(Integer count) {
        List<Long> result = new List<Long>();
        Long a = 0L;
        Long b = 1L;
        for (Integer i = 0; i < count; i++) {
            result.add(a);
            Long temp = a + b;
            a = b;
            b = temp;
        }
        return result;
    }
}
