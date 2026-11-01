def area(shape):
    match shape:
        case {"kind": "circle", "r": r}:
            return 3.14159 * r * r
        case {"kind": "rect", "w": w, "h": h}:
            return w * h
        case (w, h):
            return w * h
        case _:
            raise ValueError(shape)


print(area({"kind": "circle", "r": 2}))
print(area({"kind": "rect", "w": 3, "h": 4}))
print(area((5, 6)))
