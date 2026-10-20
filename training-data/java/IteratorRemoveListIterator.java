import java.util.*;

public class IteratorRemoveListIterator {
    public static void main(String[] args) {
        List<Integer> l = new ArrayList<>(List.of(1, 2, 3, 4, 5, 6));
        for (Iterator<Integer> it = l.iterator(); it.hasNext();) if (it.next() % 2 == 0) it.remove();
        System.out.println(l);
        ListIterator<Integer> li = l.listIterator();
        while (li.hasNext()) { int v = li.next(); li.set(v * 10); if (v == 3) li.add(99); }
        System.out.println(l);
        l.removeIf(x -> x > 50);
        System.out.println(l);
    }
}
