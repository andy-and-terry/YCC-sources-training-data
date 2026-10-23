# int.to_bytes / int.from_bytes convert between integers and byte strings.
n = 0x01020304
big = n.to_bytes(4, byteorder="big")
little = n.to_bytes(4, byteorder="little")
print(big.hex(), little.hex())

print(int.from_bytes(big, "big") == n)
print(int.from_bytes(little, "big"))  # wrong byte order gives a different value

# Signed values need signed=True, otherwise OverflowError.
neg = (-2).to_bytes(2, "big", signed=True)
print(neg.hex(), int.from_bytes(neg, "big", signed=True))

try:
    (256).to_bytes(1, "big")
except OverflowError as exc:
    print("overflow:", exc)

# Minimal byte length from bit_length().
value = 70000
size = (value.bit_length() + 7) // 8
print(size, value.to_bytes(size, "big"))
