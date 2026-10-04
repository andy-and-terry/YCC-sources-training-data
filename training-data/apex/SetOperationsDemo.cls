public class SetOperationsDemo {
    public static Set<String> union(Set<String> a, Set<String> b) {
        Set<String> result = a.clone();
        result.addAll(b);
        return result;
    }

    public static Set<String> intersection(Set<String> a, Set<String> b) {
        Set<String> result = a.clone();
        result.retainAll(b);
        return result;
    }

    public static Set<String> difference(Set<String> a, Set<String> b) {
        Set<String> result = a.clone();
        result.removeAll(b);
        return result;
    }

    public static void main() {
        Set<String> a = new Set<String>{'red', 'green', 'blue'};
        Set<String> b = new Set<String>{'blue', 'yellow'};
        System.debug('union: ' + union(a, b));
        System.debug('intersection: ' + intersection(a, b));
        System.debug('difference: ' + difference(a, b));
        System.debug('containsAll: ' + a.containsAll(new Set<String>{'red', 'blue'}));
    }
}
