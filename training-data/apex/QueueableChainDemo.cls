public class QueueableChainDemo implements Queueable {
    private Integer step;

    public QueueableChainDemo(Integer step) {
        this.step = step;
    }

    public void execute(QueueableContext ctx) {
        System.debug('Running step ' + step);
        if (step < 3) {
            System.enqueueJob(new QueueableChainDemo(step + 1));
        }
    }
}
