public class SyncJob implements Queueable {
    private Integer step;
    public SyncJob(Integer step) { this.step = step; }
    public void execute(QueueableContext ctx) {
        System.debug('step ' + step);
        if (step < 3) System.enqueueJob(new SyncJob(step + 1));
    }
}
