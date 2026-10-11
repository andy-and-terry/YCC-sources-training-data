b = "héllo".encode("utf-8")
print(b, len(b), list(b[:3]))
print(b.decode("utf-8"))
print("héllo".encode("latin-1"))
print(b"abc".hex(), bytes.fromhex("616263"))

ba = bytearray(b"hello")
ba[0] = ord("J")
ba.extend(b"!!")
print(ba, bytes(ba))

try:
    b"\xff".decode("utf-8")
except UnicodeDecodeError as e:
    print("decode error:", e.reason)
print(b"\xff".decode("utf-8", errors="replace"))

n = 1025
print(n.to_bytes(2, "big"), int.from_bytes(b"\x04\x01", "big"))
