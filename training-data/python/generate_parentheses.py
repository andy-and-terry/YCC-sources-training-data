def generate(n):
    out = []

    def build(s, opened, closed):
        if len(s) == 2 * n:
            out.append(s)
            return
        if opened < n:
            build(s + "(", opened + 1, closed)
        if closed < opened:
            build(s + ")", opened, closed + 1)

    build("", 0, 0)
    return out


if __name__ == "__main__":
    print(generate(3))
    print(len(generate(6)))
