from collections import ChainMap, Counter, OrderedDict


def top_words(text, n=3):
    return Counter(text.lower().split()).most_common(n)


if __name__ == "__main__":
    print(top_words("the cat and the hat and the bat"))

    a = Counter("abracadabra")
    b = Counter("alakazam")
    print(a + b)
    print(a - b)
    print(a & b)
    print(a | b)

    defaults = {"color": "red", "user": "guest"}
    env = {"user": "alice"}
    cli = {"color": "blue"}
    settings = ChainMap(cli, env, defaults)
    print(settings["color"], settings["user"])
    settings["debug"] = True
    print(cli)

    od = OrderedDict.fromkeys("abc")
    od.move_to_end("a")
    print(list(od))
