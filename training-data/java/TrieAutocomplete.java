import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TrieAutocomplete {
    static class TrieNode {
        Map<Character, TrieNode> children = new HashMap<>();
        boolean isWord = false;
    }

    private final TrieNode root = new TrieNode();

    public TrieAutocomplete(String[] words) {
        for (String word : words) insert(word);
    }

    public void insert(String word) {
        TrieNode node = root;
        for (char ch : word.toCharArray()) {
            node = node.children.computeIfAbsent(ch, c -> new TrieNode());
        }
        node.isWord = true;
    }

    public List<String> suggestions(String prefix) {
        TrieNode node = root;
        for (char ch : prefix.toCharArray()) {
            node = node.children.get(ch);
            if (node == null) return List.of();
        }
        List<String> results = new ArrayList<>();
        collect(node, prefix, results);
        Collections.sort(results);
        return results;
    }

    private void collect(TrieNode node, String path, List<String> results) {
        if (node.isWord) results.add(path);
        for (Map.Entry<Character, TrieNode> entry : node.children.entrySet()) {
            collect(entry.getValue(), path + entry.getKey(), results);
        }
    }

    public static void main(String[] args) {
        TrieAutocomplete ac = new TrieAutocomplete(new String[] {"cat", "car", "card", "care", "dog"});
        System.out.println(ac.suggestions("ca"));
    }
}
