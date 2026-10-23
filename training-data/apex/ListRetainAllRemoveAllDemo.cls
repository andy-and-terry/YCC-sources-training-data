public class ListRetainAllRemoveAllDemo {
    public static void run() {
        Set<String> a = new Set<String>{'x', 'y', 'z'};
        Set<String> b = new Set<String>{'y', 'z', 'w'};

        Set<String> common = a.clone();
        common.retainAll(b);
        System.debug('Intersection: ' + common);

        Set<String> onlyA = a.clone();
        onlyA.removeAll(b);
        System.debug('Difference: ' + onlyA);

        Set<String> union = a.clone();
        union.addAll(b);
        System.debug('Union: ' + union);

        System.debug('containsAll: ' + a.containsAll(common));
    }
}
