"""@property / .setter / .deleter: expose computed or validated
attribute access through plain attribute syntax."""


class Temperature:
    def __init__(self, celsius: float):
        self._celsius = celsius

    @property
    def celsius(self) -> float:
        return self._celsius

    @celsius.setter
    def celsius(self, value: float) -> None:
        if value < -273.15:
            raise ValueError("temperature below absolute zero")
        self._celsius = value

    @celsius.deleter
    def celsius(self) -> None:
        print("resetting to absolute zero")
        self._celsius = -273.15

    @property
    def fahrenheit(self) -> float:
        """Read-only, computed from celsius -- no separate backing field."""
        return self._celsius * 9 / 5 + 32


if __name__ == "__main__":
    t = Temperature(25)
    print(t.celsius, t.fahrenheit)

    t.celsius = 100
    print(t.celsius, t.fahrenheit)

    try:
        t.celsius = -300
    except ValueError as e:
        print(f"rejected: {e}")

    try:
        t.fahrenheit = 50
    except AttributeError as e:
        print(f"read-only: {e}")

    del t.celsius
    print(t.celsius)
