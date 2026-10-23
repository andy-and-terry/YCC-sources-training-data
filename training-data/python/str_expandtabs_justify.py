# Text alignment helpers on str: expandtabs, ljust, rjust, center, zfill.

rows = [("apple", 3, 0.5), ("watermelon", 12, 3.25), ("fig", 100, 12.0)]

print("tabs expanded to width 8:", "a\tb\tc".expandtabs(8))
print("tabs expanded to width 4:", "a\tb\tc".expandtabs(4))

# Build a simple aligned table with justification methods.
print("name".ljust(12) + "qty".rjust(5) + "price".rjust(8))
print("-" * 25)
for name, qty, price in rows:
    print(name.ljust(12) + str(qty).rjust(5) + f"{price:.2f}".rjust(8))

# center pads on both sides; an optional fill character is allowed.
print("[" + "title".center(15, "*") + "]")

# zfill keeps the sign and pads with zeros on the left.
print("42".zfill(6), "-42".zfill(6), "+7".zfill(4))

# Same result using format-spec mini language.
print(f"{'left':<8}|{'right':>8}|{'mid':^8}|")
