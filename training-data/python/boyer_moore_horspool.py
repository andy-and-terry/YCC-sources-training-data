def horspool(text, pattern):
    m, n = len(pattern), len(text)
    if m == 0:
        return [0]
    shift = {c: m - 1 - i for i, c in enumerate(pattern[:-1])}
    matches = []
    i = 0
    while i <= n - m:
        j = m - 1
        while j >= 0 and text[i + j] == pattern[j]:
            j -= 1
        if j < 0:
            matches.append(i)
        i += shift.get(text[i + m - 1], m)
    return matches


if __name__ == "__main__":
    print(horspool("here is a simple example, an example indeed", "example"))
