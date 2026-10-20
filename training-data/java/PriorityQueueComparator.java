import java.util.*;

public class PriorityQueueComparator {
    record Task(String name, int pri) {}

    public static void main(String[] args) {
        PriorityQueue<Task> pq = new PriorityQueue<>(Comparator.comparingInt(Task::pri).reversed().thenComparing(Task::name));
        pq.add(new Task("b", 1)); pq.add(new Task("a", 5)); pq.add(new Task("c", 5));
        while (!pq.isEmpty()) System.out.print(pq.poll().name() + " ");
        System.out.println();
    }
}
