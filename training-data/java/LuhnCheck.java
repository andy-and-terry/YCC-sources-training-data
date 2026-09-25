public class LuhnCheck {
    static boolean isValid(String input) {
        String s = input.replace(" ", "");
        if (s.length() < 2 || !s.chars().allMatch(Character::isDigit)) return false;
        int sum = 0;
        for (int i = 0; i < s.length(); i++) {
            int d = s.charAt(s.length() - 1 - i) - '0';
            if (i % 2 == 1) {
                d *= 2;
                if (d > 9) d -= 9;
            }
            sum += d;
        }
        return sum % 10 == 0;
    }

    public static void main(String[] args) {
        System.out.println(isValid("4539 3195 0343 6467") + " " + isValid("8273 1232 7352 0569"));
    }
}
