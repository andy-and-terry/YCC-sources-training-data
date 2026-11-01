public class QueueableChainEx implements Queueable {
    private Integer step;
    public QueueableChainEx(Integer step) { this.step = step; }

    public void execute(QueueableContext ctx) {
        System.debug('Step ' + step);
        if (step < 3) {
            System.enqueueJob(new QueueableChainEx(step + 1));
        }
    }
}
