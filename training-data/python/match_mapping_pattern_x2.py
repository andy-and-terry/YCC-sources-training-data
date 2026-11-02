def handle(ev):
    match ev:
        case {"type": "click", "pos": (x, y)}:
            return f"click {x},{y}"
        case {"type": "key", "key": k}:
            return f"key {k}"
        case _:
            return "unknown"

print(handle({"type": "click", "pos": (1, 2)}), handle({"type": "key", "key": "a"}))
