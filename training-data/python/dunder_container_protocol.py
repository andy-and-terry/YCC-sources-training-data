class Playlist:
    """Implements the container protocol with dunder methods."""

    def __init__(self, *songs):
        self._songs = list(songs)

    def __len__(self):
        return len(self._songs)

    def __getitem__(self, index):
        if isinstance(index, slice):
            return Playlist(*self._songs[index])
        return self._songs[index]

    def __setitem__(self, index, value):
        self._songs[index] = value

    def __delitem__(self, index):
        del self._songs[index]

    def __contains__(self, song):
        return song in self._songs

    def __iter__(self):
        return iter(self._songs)

    def __reversed__(self):
        return reversed(self._songs)

    def __add__(self, other):
        return Playlist(*self._songs, *other._songs)

    def __bool__(self):
        return bool(self._songs)

    def __repr__(self):
        return f"Playlist({', '.join(map(repr, self._songs))})"


if __name__ == "__main__":
    p = Playlist("a", "b", "c", "d")
    print(len(p), p[1], p[1:3], "c" in p)
    p[0] = "z"
    del p[1]
    print(p, list(reversed(p)))
    print(p + Playlist("x"), bool(Playlist()))
