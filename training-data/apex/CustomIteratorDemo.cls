public class CustomIteratorDemo implements Iterator<Integer> {
    private List<Integer> evens = new List<Integer>();
    private Integer position = 0;

    public CustomIteratorDemo(Integer upperBound) {
        for (Integer i = 0; i <= upperBound; i++) {
            if (Math.mod(i, 2) == 0) {
                evens.add(i);
            }
        }
    }

    public Boolean hasNext() {
        return position < evens.size();
    }

    public Integer next() {
        Integer value = evens[position];
        position++;
        return value;
    }

    public static void main() {
        CustomIteratorDemo it = new CustomIteratorDemo(10);
        while (it.hasNext()) {
            System.debug(it.next());
        }
    }
}
