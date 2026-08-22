import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class WordLadder {
    public static int ladderLength(String beginWord, String endWord, List<String> wordList) {
        Set<String> words = new HashSet<>(wordList);
        if (!words.contains(endWord)) return 0;

        Deque<Object[]> queue = new ArrayDeque<>();
        queue.add(new Object[] {beginWord, 1});
        Set<String> visited = new HashSet<>();
        visited.add(beginWord);

        while (!queue.isEmpty()) {
            Object[] entry = queue.poll();
            String word = (String) entry[0];
            int length = (int) entry[1];
            if (word.equals(endWord)) return length;

            char[] chars = word.toCharArray();
            for (int i = 0; i < chars.length; i++) {
                char original = chars[i];
                for (char ch = 'a'; ch <= 'z'; ch++) {
                    chars[i] = ch;
                    String candidate = new String(chars);
                    if (words.contains(candidate) && !visited.contains(candidate)) {
                        visited.add(candidate);
                        queue.add(new Object[] {candidate, length + 1});
                    }
                }
                chars[i] = original;
            }
        }
        return 0;
    }

    public static void main(String[] args) {
        System.out.println(ladderLength("hit", "cog", List.of("hot", "dot", "dog", "lot", "log", "cog")));
    }
}
