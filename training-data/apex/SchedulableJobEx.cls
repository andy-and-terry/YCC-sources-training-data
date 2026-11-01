global class SchedulableJobEx implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Task> overdue = [SELECT Id FROM Task WHERE ActivityDate < TODAY AND IsClosed = false LIMIT 200];
        System.debug('Overdue tasks: ' + overdue.size());
    }
    // System.schedule('Nightly', '0 0 2 * * ?', new SchedulableJobEx());
}
