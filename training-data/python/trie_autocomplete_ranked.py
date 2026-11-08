import heapq


class Node:
    def __init__(self):
        self.children = {}
        self.weight = 0


class Autocomplete:
    def __init__(self):
        self.root = Node()

    def add(self, word, weight=1):
        node = self.root
        for ch in word:
            node = node.children.setdefault(ch, Node())
        node.weight += weight

    def suggest(self, prefix, k=3):
        node = self.root
        for ch in prefix:
            if ch not in node.children:
                return []
            node = node.children[ch]
        found = []
        stack = [(node, prefix)]
        while stack:
            cur, text = stack.pop()
            if cur.weight:
                found.append((cur.weight, text))
            for ch, nxt in cur.children.items():
                stack.append((nxt, text + ch))
        return [t for _, t in heapq.nlargest(k, found)]


if __name__ == "__main__":
    ac = Autocomplete()
    for w, n in [("car", 5), ("card", 2), ("care", 7), ("cat", 1)]:
        ac.add(w, n)
    print(ac.suggest("car"))
