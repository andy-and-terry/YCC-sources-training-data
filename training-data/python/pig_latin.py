VOWELS = "aeiou"


def translate_word(word: str) -> str:
    if word[0] in VOWELS or word.startswith(("xr", "yt")):
        return word + "ay"
    for i, ch in enumerate(word):
        if ch in VOWELS or (ch == "y" and i > 0):
            if ch == "u" and i > 0 and word[i - 1] == "q":
                i += 1
            return word[i:] + word[:i] + "ay"
    return word + "ay"


def translate(sentence: str) -> str:
    return " ".join(translate_word(w) for w in sentence.lower().split())


if __name__ == "__main__":
    print(translate("quick fast run apple rhythm square"))
