REGISTRY = {}


class RegisteringMeta(type):
    def __new__(mcls, name, bases, namespace):
        cls = super().__new__(mcls, name, bases, namespace)
        if bases:
            REGISTRY[name.lower()] = cls
        return cls


class Handler(metaclass=RegisteringMeta):
    pass


class JsonHandler(Handler):
    pass


class XmlHandler(Handler):
    pass


if __name__ == "__main__":
    print(sorted(REGISTRY))
    print(REGISTRY["xmlhandler"]())
