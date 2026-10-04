public class SetOperationsDemo {
    public static void main() {
        Set<Integer> a = new Set<Integer>{ 1, 2, 3, 4 };
        Set<Integer> b = new Set<Integer>{ 3, 4, 5 };

        Set<Integer> union = a.clone();
        union.addAll(b);

        Set<Integer> inter = a.clone();
        inter.retainAll(b);

        Set<Integer> diff = a.clone();
        diff.removeAll(b);

        System.debug('union ' + union);
        System.debug('intersection ' + inter);
        System.debug('difference ' + diff);
        System.debug(a.containsAll(inter));
    }
}
