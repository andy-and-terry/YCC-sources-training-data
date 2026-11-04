public class MinStack {
    private List<Integer> vals = new List<Integer>();
    private List<Integer> mins = new List<Integer>();

    public void push(Integer x) {
        Integer m = mins.isEmpty() ? x : Math.min(x, mins[mins.size() - 1]);
        vals.add(x);
        mins.add(m);
    }

    public Integer pop() {
        mins.remove(mins.size() - 1);
        return vals.remove(vals.size() - 1);
    }

    public Integer minimum() {
        return mins[mins.size() - 1];
    }
}
