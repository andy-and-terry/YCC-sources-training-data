import java.util.PriorityQueue;

public class PriorityQueueDemo {
    record Entry(String item, int priority) {}

    public static void main(String[] args) {
        PriorityQueue<Entry> pq = new PriorityQueue<>((a, b) -> a.priority() - b.priority());
        pq.add(new Entry("low", 5));
        pq.add(new Entry("high", 1));
        pq.add(new Entry("medium", 3));
        System.out.println(pq.poll().item() + " " + pq.poll().item() + " " + pq.poll().item());
    }
}
