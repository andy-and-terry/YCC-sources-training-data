from collections import deque
import string


def word_ladder_length(begin_word, end_word, word_list):
    words = set(word_list)
    if end_word not in words:
        return 0

    queue = deque([(begin_word, 1)])
    visited = {begin_word}

    while queue:
        word, length = queue.popleft()
        if word == end_word:
            return length
        for i in range(len(word)):
            for ch in string.ascii_lowercase:
                candidate = word[:i] + ch + word[i + 1:]
                if candidate in words and candidate not in visited:
                    visited.add(candidate)
                    queue.append((candidate, length + 1))
    return 0


if __name__ == "__main__":
    print(word_ladder_length("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
