class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_word = False


class Autocomplete:
    def __init__(self, words=None):
        self.root = TrieNode()
        for word in words or []:
            self.insert(word)

    def insert(self, word: str):
        node = self.root
        for ch in word:
            node = node.children.setdefault(ch, TrieNode())
        node.is_word = True

    def suggestions(self, prefix: str):
        node = self.root
        for ch in prefix:
            if ch not in node.children:
                return []
            node = node.children[ch]

        results = []

        def collect(n, path):
            if n.is_word:
                results.append(prefix + path)
            for ch, child in n.children.items():
                collect(child, path + ch)

        collect(node, "")
        return sorted(results)


if __name__ == "__main__":
    ac = Autocomplete(["cat", "car", "card", "care", "dog"])
    print(ac.suggestions("ca"))
