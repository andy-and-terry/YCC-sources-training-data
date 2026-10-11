public class ListFilterByPredicate {
    public interface Predicate {
        Boolean test(Integer value);
    }

    public class IsEven implements Predicate {
        public Boolean test(Integer value) {
            return Math.mod(value, 2) == 0;
        }
    }

    public static List<Integer> filter(List<Integer> items, Predicate p) {
        List<Integer> out = new List<Integer>();
        for (Integer i : items) {
            if (p.test(i)) {
                out.add(i);
            }
        }
        return out;
    }

    public static void main() {
        System.debug(filter(new List<Integer>{ 1, 2, 3, 4, 5, 6 }, new IsEven()));
    }
}
