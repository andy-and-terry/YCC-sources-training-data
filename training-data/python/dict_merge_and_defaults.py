"""Dictionary idioms: merging, defaultdict, setdefault, ChainMap."""
from collections import ChainMap, defaultdict


def main():
    defaults = {"color": "red", "size": 1}
    user = {"size": 5}
    print(defaults | user)
    merged = {**defaults, **user, "extra": True}
    print(merged)
    cfg = ChainMap(user, defaults)
    print(cfg["color"], cfg["size"])
    groups = defaultdict(list)
    for w in ["apple", "avocado", "banana", "blueberry", "cherry"]:
        groups[w[0]].append(w)
    print(dict(groups))
    d = {}
    d.setdefault("k", []).append(1)
    d.setdefault("k", []).append(2)
    print(d)
    inverted = {v: k for k, v in {"a": 1, "b": 2}.items()}
    print(inverted)


if __name__ == "__main__":
    main()
