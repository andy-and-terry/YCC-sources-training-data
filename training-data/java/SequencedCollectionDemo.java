import java.util.ArrayList;
import java.util.List;
import java.util.SequencedCollection;

public class SequencedCollectionDemo {
    public static void main(String[] args) {
        // SequencedCollection (Java 21+) gives every ordered collection a
        // uniform way to reach its first/last elements and to view it
        // reversed, without needing List-specific index math.
        SequencedCollection<String> queue = new ArrayList<>(List.of("a", "b", "c"));

        System.out.println("first: " + queue.getFirst());
        System.out.println("last: " + queue.getLast());

        queue.addFirst("start");
        queue.addLast("end");
        System.out.println("after add: " + queue);

        SequencedCollection<String> reversed = queue.reversed();
        System.out.println("reversed view: " + reversed);
    }
}
