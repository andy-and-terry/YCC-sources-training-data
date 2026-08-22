import java.util.HashMap;
import java.util.Map;

public class Trie {
    static class TrieNode {
        Map<Character, TrieNode> children = new HashMap<>();
        boolean isWord = false;
    }

    private final TrieNode root = new TrieNode();

    public void insert(String word) {
        TrieNode node = root;
        for (char ch : word.toCharArray()) {
            node = node.children.computeIfAbsent(ch, c -> new TrieNode());
        }
        node.isWord = true;
    }

    public boolean search(String word) {
        TrieNode node = find(word);
        return node != null && node.isWord;
    }

    public boolean startsWith(String prefix) {
        return find(prefix) != null;
    }

    private TrieNode find(String s) {
        TrieNode node = root;
        for (char ch : s.toCharArray()) {
            node = node.children.get(ch);
            if (node == null) return null;
        }
        return node;
    }

    public static void main(String[] args) {
        Trie trie = new Trie();
        for (String word : new String[] {"cat", "car", "card", "care"}) trie.insert(word);
        System.out.println(trie.search("car") + " " + trie.search("ca") + " " + trie.startsWith("ca"));
    }
}
