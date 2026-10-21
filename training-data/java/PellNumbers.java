public class PellNumbers {
    // P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
    public static void main(String[] args) {
        long a = 0, b = 1;
        for (int i = 0; i < 15; i++) {
            System.out.println("P(" + i + ") = " + a);
            long next = 2 * b + a;
            a = b;
            b = next;
        }
    }
}
