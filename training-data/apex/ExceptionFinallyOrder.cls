public class ExceptionFinallyOrder {
    public class StepException extends Exception {}

    public static String run(Boolean fail) {
        String log = 'start;';
        try {
            log += 'try;';
            if (fail) {
                throw new StepException('boom');
            }
            log += 'ok;';
        } catch (StepException e) {
            log += 'catch:' + e.getMessage() + ';';
        } finally {
            log += 'finally;';
        }
        return log;
    }

    public static void main() {
        System.debug(run(false));
        System.debug(run(true));
    }
}
