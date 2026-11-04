public class OrdinalSuffix {
    static String ordinal(int n) {
        int r100 = n % 100;
        if (r100 >= 11 && r100 <= 13) return n + "th";
        return n + switch (n % 10) {
            case 1 -> "st";
            case 2 -> "nd";
            case 3 -> "rd";
            default -> "th";
        };
    }

    public static void main(String[] args) {
        for (int n : new int[]{1, 2, 3, 4, 11, 12, 13, 21, 101, 111}) System.out.print(ordinal(n) + " ");
        System.out.println();
    }
}
