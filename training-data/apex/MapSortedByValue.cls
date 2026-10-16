public class MapSortedByValue {
    public class Entry implements Comparable {
        public String key;
        public Integer value;
        public Entry(String key, Integer value) {
            this.key = key;
            this.value = value;
        }
        public Integer compareTo(Object other) {
            Entry o = (Entry) other;
            return o.value - value;
        }
    }

    public static void main() {
        Map<String, Integer> counts = new Map<String, Integer>{ 'x' => 3, 'y' => 9, 'z' => 5 };
        List<Entry> entries = new List<Entry>();
        for (String k : counts.keySet()) {
            entries.add(new Entry(k, counts.get(k)));
        }
        entries.sort();
        for (Entry e : entries) {
            System.debug(e.key + '=' + e.value);
        }
    }
}
