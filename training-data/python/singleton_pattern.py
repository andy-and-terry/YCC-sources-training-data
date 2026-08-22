class Singleton:
    _instance = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __init__(self, value=None):
        if not hasattr(self, "_initialized"):
            self.value = value
            self._initialized = True


if __name__ == "__main__":
    a = Singleton(1)
    b = Singleton(2)
    print(a is b, a.value, b.value)
