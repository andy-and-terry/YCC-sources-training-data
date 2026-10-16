public class BooleanLogicShortCircuit {
    private static Integer calls = 0;

    private static Boolean noisy(Boolean value) {
        calls++;
        return value;
    }

    public static void main() {
        Boolean a = noisy(false) && noisy(true);
        Boolean b = noisy(true) || noisy(false);
        System.debug(a + ' ' + b + ' calls=' + calls);
    }
}
