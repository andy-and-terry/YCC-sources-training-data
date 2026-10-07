"""Exact arithmetic with decimal.Decimal and fractions.Fraction compared
with binary floating point."""

from decimal import ROUND_HALF_UP, Decimal, getcontext
from fractions import Fraction


def invoice_total(prices, tax_rate="0.0825"):
    subtotal = sum((Decimal(p) for p in prices), Decimal("0"))
    total = subtotal * (1 + Decimal(tax_rate))
    return total.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)


if __name__ == "__main__":
    print(0.1 + 0.2 == 0.3)
    print(Decimal("0.1") + Decimal("0.2") == Decimal("0.3"))
    print(invoice_total(["19.99", "5.01", "0.10"]))

    getcontext().prec = 30
    print(Decimal(1) / Decimal(7))

    f = Fraction(3, 4) + Fraction(1, 6)
    print(f, float(f))
    print(Fraction("0.125"), Fraction(22, 7).limit_denominator(10))
