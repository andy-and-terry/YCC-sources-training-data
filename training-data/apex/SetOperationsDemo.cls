public class SetOperationsDemo {
    public static Set<Integer> intersect(Set<Integer> a, Set<Integer> b) {
        Set<Integer> result = a.clone();
        result.retainAll(b);
        return result;
    }

    public static Set<Integer> union(Set<Integer> a, Set<Integer> b) {
        Set<Integer> result = a.clone();
        result.addAll(b);
        return result;
    }

    public static Set<Integer> difference(Set<Integer> a, Set<Integer> b) {
        Set<Integer> result = a.clone();
        result.removeAll(b);
        return result;
    }

    public static void main() {
        Set<Integer> a = new Set<Integer>{1, 2, 3, 4, 5};
        Set<Integer> b = new Set<Integer>{4, 5, 6, 7};

        System.debug(union(a, b));
        System.debug(intersect(a, b));
        System.debug(difference(a, b));
        System.debug(a.containsAll(new Set<Integer>{1, 2}));

        // Set<String> is case-sensitive; normalize before adding
        Set<String> names = new Set<String>();
        for (String n : new List<String>{'Ann', 'ann', 'Bob', 'BOB'}) {
            names.add(n.toLowerCase());
        }
        System.debug(names.size());   // 2
    }
}
