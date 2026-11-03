import java.util.*;

public class SecondLargestDistinct {
    static OptionalInt secondLargest(int[] values) {
        TreeSet<Integer> distinct = new TreeSet<>(Collections.reverseOrder());
        for (int v : values) distinct.add(v);
        Iterator<Integer> it = distinct.iterator();
        if (!it.hasNext()) return OptionalInt.empty();
        it.next();
        return it.hasNext() ? OptionalInt.of(it.next()) : OptionalInt.empty();
    }

    public static void main(String[] args) {
        System.out.println(secondLargest(new int[] {5, 3, 9, 9, 1}));
        System.out.println(secondLargest(new int[] {2, 2}));
    }
}
