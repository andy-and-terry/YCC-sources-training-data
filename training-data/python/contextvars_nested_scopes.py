import contextvars

depth = contextvars.ContextVar("depth", default=0)


def visit(name: str) -> None:
    d = depth.get()
    print("  " * d + name)
    tok = depth.set(d + 1)
    try:
        if name == "root":
            visit("child-a")
            visit("child-b")
    finally:
        depth.reset(tok)


if __name__ == "__main__":
    visit("root")
