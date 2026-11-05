registry = {}


class Meta(type):
    def __new__(mcs, name, bases, ns):
        cls = super().__new__(mcs, name, bases, ns)
        if bases:
            registry[name.lower()] = cls
        return cls


class Plugin(metaclass=Meta):
    pass


class Csv(Plugin):
    pass


class Json(Plugin):
    pass


print(sorted(registry))
