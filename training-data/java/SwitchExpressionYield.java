public class SwitchExpressionYield {
    static int daysIn(int month, boolean leap) {
        return switch (month) {
            case 2 -> leap ? 29 : 28;
            case 4, 6, 9, 11 -> 30;
            default -> {
                if (month < 1 || month > 12) throw new IllegalArgumentException("month " + month);
                yield 31;
            }
        };
    }

    public static void main(String[] args) {
        System.out.println(daysIn(2, true) + " " + daysIn(4, false) + " " + daysIn(12, false));
    }
}
