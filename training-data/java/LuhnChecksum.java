public class LuhnChecksum {
    private static int sum(String digits) {
        int total = 0;
        for (int i = 0; i < digits.length(); i++) {
            int d = digits.charAt(digits.length() - 1 - i) - '0';
            if (i % 2 == 1) {
                d *= 2;
                if (d > 9) d -= 9;
            }
            total += d;
        }
        return total;
    }

    public static boolean isValid(String input) {
        String digits = input.replaceAll("\\s", "");
        if (digits.length() < 2 || !digits.chars().allMatch(Character::isDigit)) return false;
        return sum(digits) % 10 == 0;
    }

    public static int checkDigit(String partial) {
        return (10 - sum(partial + "0") % 10) % 10;
    }

    public static void main(String[] args) {
        System.out.println(isValid("4539 3195 0343 6467") + " " + isValid("8273 1232 7352 0569") + " " + isValid("12a4"));
        System.out.println("check digit for 7992739871: " + checkDigit("7992739871"));
    }
}
