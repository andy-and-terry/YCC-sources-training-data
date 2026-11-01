public class SetOperationsEx {
    public static void run() {
        Set<Integer> a = new Set<Integer>{1, 2, 3, 4};
        Set<Integer> b = new Set<Integer>{3, 4, 5};
        Set<Integer> union = a.clone(); union.addAll(b);
        Set<Integer> inter = a.clone(); inter.retainAll(b);
        Set<Integer> diff = a.clone(); diff.removeAll(b);
        System.debug(union); System.debug(inter); System.debug(diff);
    }
}
