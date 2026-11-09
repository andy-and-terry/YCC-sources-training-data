public class QueueableChain implements Queueable {
    private Integer step;
    public QueueableChain(Integer step) { this.step = step; }
    public void execute(QueueableContext ctx) {
        System.debug('step ' + step);
        if (step < 3) {
            System.enqueueJob(new QueueableChain(step + 1));
        }
    }
}
