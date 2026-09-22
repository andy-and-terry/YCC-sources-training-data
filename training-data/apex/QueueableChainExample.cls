public class QueueableChainExample implements Queueable {
    private Integer step;
    private static final Integer MAX_STEPS = 3;

    public QueueableChainExample(Integer step) {
        this.step = step;
    }

    public void execute(QueueableContext context) {
        System.debug('Executing step ' + step);
        if (step < MAX_STEPS && !Test.isRunningTest()) {
            System.enqueueJob(new QueueableChainExample(step + 1));
        }
    }

    public static void main() {
        // Simulates the chained execution without actually enqueueing async jobs.
        for (Integer step = 1; step <= MAX_STEPS; step++) {
            System.debug('Executing step ' + step);
        }
    }
}
