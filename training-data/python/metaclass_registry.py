class Registry(type):
    classes = {}

    def __new__(mcs, name, bases, ns):
        cls = super().__new__(mcs, name, bases, ns)
        mcs.classes[name] = cls
        return cls


class A(metaclass=Registry): pass
class B(metaclass=Registry): pass

if __name__ == "__main__":
    print(sorted(Registry.classes))
