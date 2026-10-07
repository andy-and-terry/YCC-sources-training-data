public class HashSetOpenAddressing {
    private static final Object TOMBSTONE = new Object();
    private Object[] slots = new Object[8];
    private int size, used;

    private int indexFor(Object key, int i) {
        int h = key.hashCode();
        h ^= (h >>> 16);
        return Math.floorMod(h + i, slots.length);
    }

    public boolean contains(Object key) {
        for (int i = 0; i < slots.length; i++) {
            Object s = slots[indexFor(key, i)];
            if (s == null) return false;
            if (s != TOMBSTONE && s.equals(key)) return true;
        }
        return false;
    }

    public boolean add(Object key) {
        if (contains(key)) return false;
        if ((used + 1) * 2 > slots.length) resize();
        for (int i = 0; ; i++) {
            int idx = indexFor(key, i);
            if (slots[idx] == null || slots[idx] == TOMBSTONE) {
                if (slots[idx] == null) used++;
                slots[idx] = key;
                size++;
                return true;
            }
        }
    }

    public boolean remove(Object key) {
        for (int i = 0; i < slots.length; i++) {
            int idx = indexFor(key, i);
            if (slots[idx] == null) return false;
            if (slots[idx] != TOMBSTONE && slots[idx].equals(key)) {
                slots[idx] = TOMBSTONE;
                size--;
                return true;
            }
        }
        return false;
    }

    private void resize() {
        Object[] old = slots;
        slots = new Object[old.length * 2];
        size = used = 0;
        for (Object o : old) if (o != null && o != TOMBSTONE) add(o);
    }

    public int size() { return size; }

    public static void main(String[] args) {
        HashSetOpenAddressing set = new HashSetOpenAddressing();
        for (String w : "the quick brown fox jumps over the lazy dog".split(" ")) set.add(w);
        set.remove("fox");
        System.out.println(set.size() + " " + set.contains("fox") + " " + set.contains("dog"));
    }
}
