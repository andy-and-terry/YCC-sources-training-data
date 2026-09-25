def c_to_f(c): return c * 9 / 5 + 32
def f_to_c(f): return (f - 32) * 5 / 9
def c_to_k(c): return c + 273.15
def k_to_c(k): return k - 273.15

CONVERTERS = {("C", "F"): c_to_f, ("F", "C"): f_to_c, ("C", "K"): c_to_k, ("K", "C"): k_to_c}


def convert(value, src, dst):
    if src == dst:
        return value
    if (src, dst) in CONVERTERS:
        return CONVERTERS[(src, dst)](value)
    return convert(convert(value, src, "C"), "C", dst)


if __name__ == "__main__":
    print(convert(100, "C", "F"))
    print(round(convert(212, "F", "K"), 2))
