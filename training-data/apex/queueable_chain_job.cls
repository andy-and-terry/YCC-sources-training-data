public class ChainJob implements Queueable {
    private Integer step;
    public ChainJob(Integer s) { step = s; }
    public void execute(QueueableContext ctx) {
        System.debug('step ' + step);
        if (step < 3) System.enqueueJob(new ChainJob(step + 1));
    }
}
