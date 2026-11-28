from functools import singledispatchmethod


class Formatter:
    @singledispatchmethod
    def fmt(self, v):
        return str(v)

    @fmt.register
    def _(self, v: float):
        return f"{v:.2f}"

    @fmt.register
    def _(self, v: bool):
        return "yes" if v else "no"


if __name__ == "__main__":
    f = Formatter()
    print(f.fmt(3.14159), f.fmt(True), f.fmt("x"))
