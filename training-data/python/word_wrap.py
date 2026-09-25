def wrap(text, width):
    lines, line = [], ""
    for word in text.split():
        while len(word) > width:
            if line:
                lines.append(line)
                line = ""
            lines.append(word[:width])
            word = word[width:]
        if not line:
            line = word
        elif len(line) + 1 + len(word) <= width:
            line += " " + word
        else:
            lines.append(line)
            line = word
    if line:
        lines.append(line)
    return lines


if __name__ == "__main__":
    text = "The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically"
    for ln in wrap(text, 16):
        print(f"|{ln:<16}|")
