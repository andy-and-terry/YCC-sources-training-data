def compress(s):
    if not s:
        return s
    out = []
    count = 1
    for prev, cur in zip(s, s[1:]):
        if cur == prev:
            count += 1
        else:
            out.append(f"{prev}{count}")
            count = 1
    out.append(f"{s[-1]}{count}")
    result = "".join(out)
    return result if len(result) < len(s) else s


if __name__ == "__main__":
    for w in ("aabcccccaaa", "abc", "zzzzzzzzzz"):
        print(w, "->", compress(w))
