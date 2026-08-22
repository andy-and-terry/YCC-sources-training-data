def encode(s: str) -> str:
    if not s:
        return ""
    result = []
    count = 1
    for i in range(1, len(s) + 1):
        if i < len(s) and s[i] == s[i - 1]:
            count += 1
        else:
            result.append(f"{s[i - 1]}{count}")
            count = 1
    return "".join(result)


def decode(s: str) -> str:
    result = []
    i = 0
    while i < len(s):
        char = s[i]
        j = i + 1
        while j < len(s) and s[j].isdigit():
            j += 1
        result.append(char * int(s[i + 1:j]))
        i = j
    return "".join(result)


if __name__ == "__main__":
    encoded = encode("aaabbbccd")
    print(encoded)
    print(decode(encoded))
