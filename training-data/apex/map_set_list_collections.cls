public class CollectionsTour {
    public static void run() {
        Set<String> s = new Set<String>{'a', 'b', 'a'};
        Map<String, Integer> m = new Map<String, Integer>{'x' => 1};
        m.put('y', 2);
        List<Integer> l = new List<Integer>{3, 1, 2};
        l.sort();
        System.debug(s.size() + ' ' + m.keySet() + ' ' + l);
    }
}
