from array import array

a = array("i", [1, 2, 3])
a.append(4)
a.extend([5, 6])
print(a, a.itemsize, a.typecode)
print(a.tobytes()[:8])
print(a[1:4], a.index(3), sum(a))

b = array("d", [0.5, 1.5])
print(b.tolist())

try:
    a.append(1.5)
except TypeError as e:
    print("TypeError:", e)

raw = array("B", b"\x01\x02\xff")
print(list(raw))
a.reverse()
print(a.tolist())
