public class WordFrequency {
    public static Map<String, Integer> wordFrequency(String text) {
        Map<String, Integer> freq = new Map<String, Integer>();
        for (String w : text.split(' ')) {
            freq.put(w, (freq.containsKey(w) ? freq.get(w) : 0) + 1);
        }
        return freq;
    }

    public static void main() {
        System.debug(wordFrequency('the quick brown fox the lazy dog the fox'));
    }
}
