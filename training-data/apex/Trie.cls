public class Trie {
    private Map<String, Trie> children = new Map<String, Trie>();
    private Boolean isEnd = false;

    public void insert(String word) {
        Trie node = this;
        for (Integer i = 0; i < word.length(); i++) {
            String c = word.substring(i, i + 1);
            if (!node.children.containsKey(c)) {
                node.children.put(c, new Trie());
            }
            node = node.children.get(c);
        }
        node.isEnd = true;
    }

    public Boolean contains(String word) {
        Trie node = this;
        for (Integer i = 0; i < word.length(); i++) {
            String c = word.substring(i, i + 1);
            if (!node.children.containsKey(c)) {
                return false;
            }
            node = node.children.get(c);
        }
        return node.isEnd;
    }

    public static void main() {
        Trie t = new Trie();
        t.insert('cat');
        t.insert('car');
        System.debug(t.contains('cat'));
        System.debug(t.contains('ca'));
    }
}
