class Temp:
    __slots__ = ("_c",)

    def __init__(self, c: float):
        self.c = c

    @property
    def c(self) -> float:
        return self._c

    @c.setter
    def c(self, v: float) -> None:
        if v < -273.15:
            raise ValueError("below absolute zero")
        self._c = v

    @property
    def f(self) -> float:
        return self._c * 9 / 5 + 32


print(Temp(100).f)
