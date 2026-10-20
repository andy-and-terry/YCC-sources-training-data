class Window:
    def __init__(self, data):
        self.data = list(data)

    def __getitem__(self, key):
        if isinstance(key, slice):
            return Window(self.data[key])
        return self.data[key]

    def __len__(self):
        return len(self.data)


if __name__ == "__main__":
    w = Window(range(10))
    print(w[2], len(w[2:6]))
