public class SortableItem implements Comparable {
    public String name; public Integer rank;
    public SortableItem(String n, Integer r) { name = n; rank = r; }
    public Integer compareTo(Object o) { return rank - ((SortableItem) o).rank; }
}
