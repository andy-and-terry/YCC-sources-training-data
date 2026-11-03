def count_vowels(s: str) -> dict:
    result = {v: 0 for v in "aeiou"}
    for ch in s.lower():
        if ch in result:
            result[ch] += 1
    return result


if __name__ == "__main__":
    print(count_vowels("Education is beautiful"))
