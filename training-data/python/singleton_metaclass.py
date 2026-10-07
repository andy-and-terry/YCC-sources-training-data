"""A metaclass-based singleton: intercepting __call__ on the metaclass
controls what happens when the class itself is "called" to create an
instance, which is a different mechanism than overriding __new__ on
the class (compare with singleton_pattern.py)."""


class SingletonMeta(type):
    _instances: dict = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super().__call__(*args, **kwargs)
        return cls._instances[cls]


class Configuration(metaclass=SingletonMeta):
    def __init__(self, source: str = "default"):
        self.source = source
        self.settings = {}

    def set(self, key: str, value) -> None:
        self.settings[key] = value


class Logger(metaclass=SingletonMeta):
    def __init__(self):
        self.messages = []

    def log(self, message: str) -> None:
        self.messages.append(message)


if __name__ == "__main__":
    config_a = Configuration("file.ini")
    config_b = Configuration("ignored because config_a already exists")
    print(config_a is config_b, config_a.source)

    config_a.set("debug", True)
    print(config_b.settings)  # same underlying instance

    # Each class gets its own single instance -- singletons don't collide
    # across unrelated classes just because they share the metaclass.
    logger_a = Logger()
    logger_b = Logger()
    print(logger_a is logger_b)
    print(config_a is logger_a)
