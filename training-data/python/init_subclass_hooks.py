class Base:
    subclasses = []

    def __init_subclass__(cls, /, tag="", **kw):
        super().__init_subclass__(**kw)
        cls.tag = tag
        Base.subclasses.append(cls)


class A(Base, tag="alpha"):
    pass


class B(Base, tag="beta"):
    pass


if __name__ == "__main__":
    print([c.tag for c in Base.subclasses])
