public class CharacterClassification {
    public static void main(String[] args) {
        String text = "Hello, World 42! éß_";
        int letters = 0, digits = 0, spaces = 0, upper = 0, other = 0;
        for (char c : text.toCharArray()) {
            if (Character.isLetter(c)) {
                letters++;
                if (Character.isUpperCase(c)) upper++;
            } else if (Character.isDigit(c)) digits++;
            else if (Character.isWhitespace(c)) spaces++;
            else other++;
        }
        System.out.printf("letters=%d upper=%d digits=%d spaces=%d other=%d%n", letters, upper, digits, spaces, other);
        System.out.println(Character.getNumericValue('7') + " " + Character.forDigit(11, 16));
        System.out.println(Character.toChars(0x1F600).length + " chars for emoji");
    }
}
