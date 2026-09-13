public class BatchableSketch implements Database.Batchable<Integer> {
    public Iterable<Integer> start(Database.BatchableContext bc) {
        return new List<Integer>{1, 2, 3, 4, 5};
    }

    public void execute(Database.BatchableContext bc, List<Integer> scope) {
        for (Integer n : scope) {
            System.debug('Processing record ' + n);
        }
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Batch complete');
    }

    public static void main() {
        BatchableSketch job = new BatchableSketch();
        List<Integer> scope = new List<Integer>();
        for (Integer n : job.start(null)) {
            scope.add(n);
        }
        job.execute(null, scope);
        job.finish(null);
    }
}
