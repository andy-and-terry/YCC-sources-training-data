def rot13(s):
    out = []
    for c in s:
        if "a" <= c <= "z":
            out.append(chr((ord(c) - 97 + 13) % 26 + 97))
        elif "A" <= c <= "Z":
            out.append(chr((ord(c) - 65 + 13) % 26 + 65))
        else:
            out.append(c)
    return "".join(out)


if __name__ == "__main__":
    import codecs
    text = "Why did the chicken cross the road?"
    assert rot13(text) == codecs.encode(text, "rot13")
    print(rot13(text))
    print(rot13(rot13(text)))
