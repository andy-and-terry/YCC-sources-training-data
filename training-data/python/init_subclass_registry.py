class Plugin:
    registry = {}

    def __init_subclass__(cls, /, key=None, **kwargs):
        super().__init_subclass__(**kwargs)
        cls.registry[key or cls.__name__.lower()] = cls


class Csv(Plugin):
    pass


class Json(Plugin, key="js"):
    pass


class_getitem_note = """__class_getitem__ lets a class be subscripted: Box[int]."""


class Box:
    def __class_getitem__(cls, item):
        return f"{cls.__name__}<{getattr(item, '__name__', item)}>"


if __name__ == "__main__":
    print(sorted(Plugin.registry))
    print(Box[int], Box["T"])
