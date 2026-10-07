"""weakref.WeakValueDictionary: cache objects without keeping them
alive -- entries disappear on their own once nothing else references
the value, avoiding unbounded memory growth."""

import gc
import weakref


class Image:
    def __init__(self, name: str):
        self.name = name

    def __repr__(self) -> str:
        return f"Image({self.name!r})"


class ImageCache:
    def __init__(self):
        self._cache: "weakref.WeakValueDictionary[str, Image]" = weakref.WeakValueDictionary()

    def load(self, name: str) -> Image:
        cached = self._cache.get(name)
        if cached is not None:
            return cached
        image = Image(name)
        self._cache[name] = image
        return image

    def __len__(self) -> int:
        return len(self._cache)


if __name__ == "__main__":
    cache = ImageCache()

    kept = cache.load("logo.png")
    cache.load("banner.png")  # no strong reference kept elsewhere
    print("cached before gc:", len(cache))

    gc.collect()
    print("cached after gc:", len(cache))
    print("still alive:", kept)
