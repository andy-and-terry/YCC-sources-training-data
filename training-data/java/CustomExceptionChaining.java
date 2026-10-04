public class CustomExceptionChaining {
    static class ValidationException extends Exception {
        private final String field;
        ValidationException(String field, String msg, Throwable cause) {
            super(msg, cause);
            this.field = field;
        }
        String field() { return field; }
    }

    static int parseAge(String s) throws ValidationException {
        try {
            int age = Integer.parseInt(s);
            if (age < 0) throw new IllegalArgumentException("negative");
            return age;
        } catch (RuntimeException e) {
            throw new ValidationException("age", "invalid age: " + s, e);
        }
    }

    public static void main(String[] args) {
        for (String s : new String[] {"42", "abc", "-5"}) {
            try {
                System.out.println(parseAge(s));
            } catch (ValidationException e) {
                System.out.println(e.field() + ": " + e.getMessage() + " <- " + e.getCause().getClass().getSimpleName());
            } finally {
                System.out.println("checked " + s);
            }
        }
    }
}
