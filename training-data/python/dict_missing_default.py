class DefaultingDict(dict):
    """__missing__ is called by dict.__getitem__ for absent keys."""

    def __init__(self, factory, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.factory = factory

    def __missing__(self, key):
        value = self[key] = self.factory(key)
        return value


class CaseInsensitiveKeys(dict):
    def __missing__(self, key):
        if isinstance(key, str) and key.lower() != key:
            return self[key.lower()]
        raise KeyError(key)


if __name__ == "__main__":
    squares = DefaultingDict(lambda n: n * n)
    print(squares[7], dict(squares))
    headers = CaseInsensitiveKeys({"content-type": "text/html"})
    print(headers["Content-Type"])
