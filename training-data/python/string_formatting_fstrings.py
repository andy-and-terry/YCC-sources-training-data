"""f-string format specs, alignment, and debugging output."""
from datetime import date


def main():
    name, score, ratio = "Ada", 92.456, 0.8731
    print(f"{name:>8}|{name:<8}|{name:^8}|")
    print(f"{score:.1f} {score:10.2f} {ratio:.1%}")
    print(f"{1234567:,} {255:#x} {255:08b} {5:+d}")
    print(f"{name=} {score=:.0f}")
    print(f"{date(2024, 3, 9):%Y/%m/%d %A}")
    width, prec = 9, 3
    print(f"{3.14159265:{width}.{prec}f}")
    print(f"{name!r} {'tab'!s:*^9}")
    rows = [("pen", 1.5), ("notebook", 12.25)]
    for item, price in rows:
        print(f"{item:<10}{price:>7.2f}")


if __name__ == "__main__":
    main()
