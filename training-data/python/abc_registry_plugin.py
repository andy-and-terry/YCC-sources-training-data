class Plugin:
    registry = {}

    def __init_subclass__(cls, /, name=None, **kwargs):
        super().__init_subclass__(**kwargs)
        Plugin.registry[name or cls.__name__.lower()] = cls

    def run(self, data):
        raise NotImplementedError


class Upper(Plugin):
    def run(self, data):
        return data.upper()


class Reverse(Plugin, name="rev"):
    def run(self, data):
        return data[::-1]


class Exclaim(Plugin):
    def run(self, data):
        return data + "!"


def pipeline(data, *names):
    for name in names:
        data = Plugin.registry[name]().run(data)
    return data


if __name__ == "__main__":
    print(sorted(Plugin.registry))
    print(pipeline("hello", "upper", "rev", "exclaim"))
