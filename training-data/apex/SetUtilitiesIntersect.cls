public class SetUtilitiesIntersect {
    public static Set<Integer> intersect(Set<Integer> a, Set<Integer> b) {
        Set<Integer> result = a.clone();
        result.retainAll(b);
        return result;
    }

    public static Set<Integer> difference(Set<Integer> a, Set<Integer> b) {
        Set<Integer> result = a.clone();
        result.removeAll(b);
        return result;
    }

    public static void main() {
        Set<Integer> x = new Set<Integer>{ 1, 2, 3, 4 };
        Set<Integer> y = new Set<Integer>{ 3, 4, 5 };
        System.debug(intersect(x, y));
        System.debug(difference(x, y));
    }
}
