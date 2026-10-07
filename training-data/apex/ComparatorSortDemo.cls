public class ComparatorSortDemo {
    public class ByLengthThenAlpha implements System.Comparator<String> {
        public Integer compare(String a, String b) {
            if (a.length() != b.length()) {
                return a.length() - b.length();
            }
            return a.compareTo(b);
        }
    }

    public static void main() {
        List<String> words = new List<String>{ 'pear', 'fig', 'banana', 'apple', 'kiwi' };
        words.sort(new ByLengthThenAlpha());
        System.debug(words); // (fig, kiwi, pear, apple, banana)
    }
}
