import weakref


class Blob:
    def __init__(self, name):
        self.name = name


cache = weakref.WeakValueDictionary()


def get_blob(name):
    blob = cache.get(name)
    if blob is None:
        blob = Blob(name)
        cache[name] = blob
    return blob


if __name__ == "__main__":
    a = get_blob("x")
    print(get_blob("x") is a)
    print(len(cache))
    del a
    print(len(cache))
