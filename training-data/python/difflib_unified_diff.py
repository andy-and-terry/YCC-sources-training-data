import difflib


def show_diff(old, new):
    diff = difflib.unified_diff(
        old.splitlines(), new.splitlines(), "old.txt", "new.txt", lineterm=""
    )
    return "\n".join(diff)


if __name__ == "__main__":
    old = "alpha\nbeta\ngamma\ndelta"
    new = "alpha\nbeta2\ngamma\ndelta\nepsilon"
    print(show_diff(old, new))
    print(difflib.get_close_matches("appel", ["apple", "ape", "maple", "peach"]))
    print(round(difflib.SequenceMatcher(None, "kitten", "sitting").ratio(), 3))
