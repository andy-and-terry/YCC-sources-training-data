"""Fuzzy matching and diffs with difflib."""
import difflib


def main():
    words = ["apple", "apply", "ape", "maple", "banana"]
    print(difflib.get_close_matches("appel", words, n=3, cutoff=0.6))

    ratio = difflib.SequenceMatcher(None, "kitten", "sitting").ratio()
    print(f"ratio: {ratio:.3f}")

    old = ["line one", "line two", "line three"]
    new = ["line one", "line 2", "line three", "line four"]
    for line in difflib.unified_diff(old, new, "old.txt", "new.txt", lineterm=""):
        print(line)

    matcher = difflib.SequenceMatcher(None, "abcdef", "abXdeYf")
    for tag, i1, i2, j1, j2 in matcher.get_opcodes():
        print(tag, repr("abcdef"[i1:i2]), "->", repr("abXdeYf"[j1:j2]))


if __name__ == "__main__":
    main()
