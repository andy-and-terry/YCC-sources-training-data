public class CustomExceptionEx {
    public class ValidationException extends Exception {}

    public static void validate(Integer qty) {
        if (qty <= 0) {
            throw new ValidationException('Quantity must be positive: ' + qty);
        }
    }

    public static String safe(Integer qty) {
        try {
            validate(qty);
            return 'ok';
        } catch (ValidationException e) {
            return e.getMessage();
        } finally {
            System.debug('checked ' + qty);
        }
    }
}
