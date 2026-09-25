VOWELS = set("aeiouAEIOU")


def pig_word(word):
    if word[0] in VOWELS:
        return word + "way"
    for i, c in enumerate(word):
        if c in VOWELS:
            return word[i:] + word[:i] + "ay"
    return word + "ay"


def pig_latin(sentence):
    return " ".join(pig_word(w) for w in sentence.split())


if __name__ == "__main__":
    print(pig_latin("the quick brown fox jumps over the lazy dog"))
