import java.util.ArrayList;
import java.util.List;
import java.util.Spliterator;

public class SpliteratorDemo {
    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= 8; i++) list.add(i);

        Spliterator<Integer> right = list.spliterator();
        Spliterator<Integer> left = right.trySplit();

        System.out.print("left: ");
        left.forEachRemaining(x -> System.out.print(x + " "));
        System.out.print("\nright: ");
        right.tryAdvance(x -> System.out.print("first=" + x + " "));
        right.forEachRemaining(x -> System.out.print(x + " "));
        System.out.println();
        System.out.println("sized: " + list.spliterator().hasCharacteristics(Spliterator.SIZED));
    }
}
