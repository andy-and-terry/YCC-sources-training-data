public class CustomExceptionHierarchy {
    public virtual class AppException extends Exception {}
    public class ValidationException extends AppException {}

    public static void validate(Integer age) {
        if (age < 0) {
            throw new ValidationException('Age cannot be negative');
        }
    }

    public static String safeValidate(Integer age) {
        try {
            validate(age);
            return 'ok';
        } catch (AppException e) {
            return 'error: ' + e.getMessage();
        }
    }
}
