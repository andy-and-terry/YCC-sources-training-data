public class IdempotentRetryWithLimits {
    public class RetryException extends Exception {}

    public static Integer attempts = 0;

    public static String flakyCall() {
        attempts++;
        if (attempts < 3) {
            throw new RetryException('Transient failure ' + attempts);
        }
        return 'ok after ' + attempts;
    }

    public static String callWithRetry(Integer maxAttempts) {
        for (Integer i = 1; i <= maxAttempts; i++) {
            try {
                return flakyCall();
            } catch (RetryException e) {
                System.debug('Attempt ' + i + ' failed: ' + e.getMessage());
            }
        }
        throw new RetryException('Gave up after ' + maxAttempts);
    }

    public static void run() {
        System.debug(callWithRetry(5));
    }
}
