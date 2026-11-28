public class ValidationException extends Exception {}

public class Validator {
    public static void requirePositive(Integer n) {
        if (n <= 0) {
            throw new ValidationException('Expected positive, got ' + n);
        }
    }
}
