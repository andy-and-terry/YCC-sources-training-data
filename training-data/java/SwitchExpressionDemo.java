public class SwitchExpressionDemo {
    enum Day { MON, TUE, WED, THU, FRI, SAT, SUN }

    static int letters(Day d) {
        return switch (d) {
            case MON, FRI, SUN -> 6;
            case TUE -> 7;
            case THU, SAT -> 8;
            case WED -> {
                int base = 9;
                yield base;
            }
        };
    }

    static String classify(int n) {
        return switch (Integer.signum(n)) {
            case -1 -> "negative";
            case 0 -> "zero";
            default -> "positive";
        };
    }

    public static void main(String[] args) {
        for (Day d : Day.values()) System.out.println(d + " " + letters(d));
        System.out.println(classify(-5) + " " + classify(0) + " " + classify(7));
    }
}
