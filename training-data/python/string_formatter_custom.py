import string


class UpperFormatter(string.Formatter):
    def convert_field(self, value, conversion):
        if conversion == "u":
            return str(value).upper()
        return super().convert_field(value, conversion)


class Money:
    def __init__(self, cents):
        self.cents = cents

    def __format__(self, spec):
        if spec == "":
            spec = "usd"
        if spec == "usd":
            return f"${self.cents / 100:,.2f}"
        raise ValueError(f"unknown format spec {spec!r}")


if __name__ == "__main__":
    print(UpperFormatter().format("{name!u} is {age}", name="ada", age=36))
    print(f"{Money(123456)} / {Money(5):usd}")
    print([f[1] for f in string.Formatter().parse("{a} and {b:>5}") if f[1]])
