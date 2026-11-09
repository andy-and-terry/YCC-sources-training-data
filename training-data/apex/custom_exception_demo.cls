public class CustomExceptionDemo {
    public class ValidationException extends Exception {}
    public static void check(Integer qty) {
        if (qty <= 0) {
            throw new ValidationException('Quantity must be positive: ' + qty);
        }
    }
    public static String safe(Integer qty) {
        try {
            check(qty);
            return 'ok';
        } catch (ValidationException e) {
            return e.getMessage();
        }
    }
}
