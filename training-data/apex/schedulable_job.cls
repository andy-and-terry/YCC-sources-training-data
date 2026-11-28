global class NightlySync implements Schedulable {
    global void execute(SchedulableContext sc) {
        System.debug('Running sync at ' + System.now());
    }
}
