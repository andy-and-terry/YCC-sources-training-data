public class SetUnionIntersectDemo {
    public static Set<String> common(Set<String> a, Set<String> b) {
        Set<String> r = a.clone();
        r.retainAll(b);
        return r;
    }
    public static Set<String> either(Set<String> a, Set<String> b) {
        Set<String> r = new Set<String>(a);
        r.addAll(b);
        return r;
    }
}
