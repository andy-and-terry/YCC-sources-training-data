public class ValidateEmailRegex {
    private static final Pattern EMAIL = Pattern.compile('^[\\w.+-]+@[\\w-]+(\\.[\\w-]+)+$');

    public static Boolean isValid(String email) {
        return email != null && EMAIL.matcher(email).matches();
    }

    public static void main() {
        System.debug(isValid('dev@example.com'));
        System.debug(isValid('not-an-email'));
        System.debug(isValid(null));
    }
}
