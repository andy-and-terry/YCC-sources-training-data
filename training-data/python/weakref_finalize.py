import gc
import weakref


class Resource:
    def __init__(self, name):
        self.name = name


def cleanup(name):
    print(f"cleaning up {name}")


if __name__ == "__main__":
    res = Resource("socket")
    fin = weakref.finalize(res, cleanup, res.name)
    print(fin.alive)
    del res
    gc.collect()
    print(fin.alive)

    keep = Resource("file")
    f2 = weakref.finalize(keep, cleanup, keep.name)
    f2.atexit = True  # runs at interpreter exit if still alive
    f2.detach()  # cancel it
    print(f2.alive)
