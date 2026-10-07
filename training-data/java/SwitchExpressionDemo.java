public class SwitchExpressionDemo {
    enum Level { LOW, MEDIUM, HIGH }

    static int score(Level l) {
        return switch (l) {
            case LOW -> 1;
            case MEDIUM -> 5;
            case HIGH -> 10;
        };
    }

    static String describe(int n) {
        return switch (n) {
            case 1, 2, 3 -> "small";
            case 4, 5, 6 -> "medium";
            default -> {
                String s = n > 100 ? "huge" : "large";
                yield s;
            }
        };
    }

    public static void main(String[] args) {
        for (Level l : Level.values()) System.out.println(l + " " + score(l));
        System.out.println(describe(2) + " " + describe(5) + " " + describe(50) + " " + describe(500));
    }
}
