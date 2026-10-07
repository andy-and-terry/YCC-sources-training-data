def is_isogram(word: str) -> bool:
    letters = [c.lower() for c in word if c.isalpha()]
    return len(letters) == len(set(letters))


if __name__ == "__main__":
    for w in ["lumberjacks", "background", "six-year-old", "isograms"]:
        print(w, is_isogram(w))
