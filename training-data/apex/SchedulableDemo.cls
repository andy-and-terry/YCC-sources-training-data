public class SchedulableDemo implements Schedulable {
    public void execute(SchedulableContext ctx) {
        System.debug('Scheduled job running at ' + System.now());
        cleanupOldRecords();
    }

    private void cleanupOldRecords() {
        System.debug('Cleaning up old records...');
    }

    public static void main() {
        String cronExpr = '0 0 2 * * ?';
        System.schedule('Nightly Cleanup Job', cronExpr, new SchedulableDemo());
    }
}
