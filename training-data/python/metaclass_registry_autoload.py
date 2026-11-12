class Meta(type):
    registry = {}
    def __new__(mcs, name, bases, ns):
        cls = super().__new__(mcs, name, bases, ns)
        if bases:
            mcs.registry[name.lower()] = cls
        return cls

class Base(metaclass=Meta): pass
class Csv(Base): pass
class Json(Base): pass
print(sorted(Meta.registry))
