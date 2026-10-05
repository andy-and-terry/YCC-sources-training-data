public class MergeIntervals {
    public class Interval implements Comparable {
        public Integer start;
        public Integer endPos;
        public Interval(Integer s, Integer e) {
            start = s;
            endPos = e;
        }
        public Integer compareTo(Object other) {
            return start - ((Interval) other).start;
        }
    }

    public static List<Interval> merge(List<Interval> input) {
        input.sort();
        List<Interval> result = new List<Interval>();
        for (Interval cur : input) {
            if (result.isEmpty() || result[result.size() - 1].endPos < cur.start) {
                result.add(cur);
            } else {
                Interval last = result[result.size() - 1];
                last.endPos = Math.max(last.endPos, cur.endPos);
            }
        }
        return result;
    }

    public static void main() {
        List<Interval> in1 = new List<Interval>{
            new Interval(8, 10), new Interval(1, 3), new Interval(2, 6), new Interval(15, 18)
        };
        for (Interval i : merge(in1)) {
            System.debug('[' + i.start + ', ' + i.endPos + ']');
        }
    }
}
