public class SetOperationsDemo {
    public static void run() {
        Set<Integer> a = new Set<Integer>{1, 2, 3, 4};
        Set<Integer> b = new Set<Integer>{3, 4, 5};

        Set<Integer> union = a.clone();
        union.addAll(b);

        Set<Integer> intersection = a.clone();
        intersection.retainAll(b);

        Set<Integer> difference = a.clone();
        difference.removeAll(b);

        System.debug(union);            // {1, 2, 3, 4, 5}
        System.debug(intersection);     // {3, 4}
        System.debug(difference);       // {1, 2}
        System.debug(a.containsAll(intersection));
    }
}
