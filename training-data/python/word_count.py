import collections
import re


def word_count(text):
    words = re.findall(r"[a-zA-Z']+", text.lower())
    return collections.Counter(words)


if __name__ == "__main__":
    sample = "the quick brown fox jumps over the lazy dog the fox runs"
    for word, count in word_count(sample).most_common(3):
        print(word, count)
