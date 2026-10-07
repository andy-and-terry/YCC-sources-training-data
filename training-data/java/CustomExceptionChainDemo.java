public class CustomExceptionChainDemo {
    static class DataAccessException extends Exception {
        DataAccessException(String msg, Throwable cause) {
            super(msg, cause);
        }
    }

    static class ServiceException extends RuntimeException {
        private final int code;

        ServiceException(String msg, int code, Throwable cause) {
            super(msg, cause);
            this.code = code;
        }

        int code() { return code; }
    }

    static void query() throws DataAccessException {
        try {
            Integer.parseInt("not-a-number");
        } catch (NumberFormatException e) {
            throw new DataAccessException("failed to parse row id", e);
        }
    }

    static void handle() {
        try {
            query();
        } catch (DataAccessException e) {
            throw new ServiceException("request failed", 500, e);
        }
    }

    public static void main(String[] args) {
        try {
            handle();
        } catch (ServiceException e) {
            System.out.println(e.getMessage() + " (code " + e.code() + ")");
            for (Throwable t = e.getCause(); t != null; t = t.getCause()) {
                System.out.println("  caused by: " + t.getClass().getSimpleName() + ": " + t.getMessage());
            }
        }
    }
}
