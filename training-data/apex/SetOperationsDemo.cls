public class SetOperationsDemo {
    public static void main() {
        Set<Integer> a = new Set<Integer>{ 1, 2, 3, 4 };
        Set<Integer> b = new Set<Integer>{ 3, 4, 5 };

        Set<Integer> union = new Set<Integer>(a);
        union.addAll(b);

        Set<Integer> intersection = new Set<Integer>(a);
        intersection.retainAll(b);

        Set<Integer> difference = new Set<Integer>(a);
        difference.removeAll(b);

        System.debug('union: ' + union);
        System.debug('intersection: ' + intersection);
        System.debug('difference: ' + difference);
        System.debug('contains 3: ' + a.contains(3));
        System.debug('a contains all of {3,4}: ' + a.containsAll(new Set<Integer>{ 3, 4 }));
    }
}
