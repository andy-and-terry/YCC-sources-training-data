public class VowelCounter {
    public static Map<String, Integer> countVowels(String s) {
        Map<String, Integer> counts = new Map<String, Integer>{
            'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0
        };
        for (String c : s.toLowerCase().split('')) {
            if (counts.containsKey(c)) counts.put(c, counts.get(c) + 1);
        }
        return counts;
    }
}
