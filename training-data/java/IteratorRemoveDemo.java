import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class IteratorRemoveDemo {
    public static void main(String[] args) {
        List<Integer> nums = new ArrayList<>(List.of(1, 2, 3, 4, 5, 6, 7, 8));

        try {
            for (Integer n : nums) {
                if (n % 2 == 0) nums.remove(n);
            }
        } catch (java.util.ConcurrentModificationException e) {
            System.out.println("caught " + e.getClass().getSimpleName());
        }

        Iterator<Integer> it = nums.iterator();
        while (it.hasNext()) {
            if (it.next() % 2 == 0) it.remove();
        }
        System.out.println(nums);

        ListIterator<Integer> li = nums.listIterator();
        while (li.hasNext()) {
            int v = li.next();
            li.set(v * 10);
            if (v == 3) li.add(35);
        }
        System.out.println(nums);

        nums.removeIf(n -> n > 50);
        System.out.println(nums);
    }
}
