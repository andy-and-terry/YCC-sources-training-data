import heapq
from collections import Counter


class Node:
    def __init__(self, char, freq, left=None, right=None):
        self.char = char
        self.freq = freq
        self.left = left
        self.right = right

    def __lt__(self, other):
        return self.freq < other.freq


def build_tree(text: str) -> Node:
    counts = Counter(text)
    heap = [Node(ch, freq) for ch, freq in counts.items()]
    heapq.heapify(heap)
    while len(heap) > 1:
        a = heapq.heappop(heap)
        b = heapq.heappop(heap)
        heapq.heappush(heap, Node(None, a.freq + b.freq, a, b))
    return heap[0]


def build_codes(node: Node, prefix: str = "", codes=None) -> dict:
    if codes is None:
        codes = {}
    if node.char is not None:
        codes[node.char] = prefix or "0"
        return codes
    build_codes(node.left, prefix + "0", codes)
    build_codes(node.right, prefix + "1", codes)
    return codes


def encode(text: str) -> str:
    codes = build_codes(build_tree(text))
    return "".join(codes[ch] for ch in text)


if __name__ == "__main__":
    print(encode("abracadabra"))
