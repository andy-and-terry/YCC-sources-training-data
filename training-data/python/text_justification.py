def full_justify(words, width):
    lines, i = [], 0
    while i < len(words):
        j, length = i, 0
        while j < len(words) and length + len(words[j]) + (j - i) <= width:
            length += len(words[j])
            j += 1
        gaps = j - i - 1
        if j == len(words) or gaps == 0:
            line = " ".join(words[i:j]).ljust(width)
        else:
            spaces, extra = divmod(width - length, gaps)
            line = ""
            for k, w in enumerate(words[i:j - 1]):
                line += w + " " * (spaces + (1 if k < extra else 0))
            line += words[j - 1]
        lines.append(line)
        i = j
    return lines


if __name__ == "__main__":
    words = "This is an example of text justification done greedily line by line".split()
    for ln in full_justify(words, 20):
        print(f"[{ln}]")
