public class ExceptionsCustomRethrow {
    public class ValidationException extends Exception {}
    public class RetryableException extends Exception {}

    public static Integer parsePositive(String s) {
        try {
            Integer n = Integer.valueOf(s);
            if (n < 0) throw new ValidationException('negative: ' + n);
            return n;
        } catch (TypeException e) {
            throw new ValidationException('not a number: ' + s);
        }
    }

    public static String safeRun(String input) {
        try {
            return 'ok ' + parsePositive(input);
        } catch (ValidationException e) {
            return 'invalid: ' + e.getMessage();
        } catch (Exception e) {
            return 'unexpected ' + e.getTypeName();
        } finally {
            System.debug('processed ' + input);
        }
    }

    public static void withCause() {
        try {
            Integer x = 1 / 0;
        } catch (MathException e) {
            RetryableException r = new RetryableException('wrapped');
            r.initCause(e);
            throw r;
        }
    }
}
