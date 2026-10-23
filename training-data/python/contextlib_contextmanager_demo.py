from contextlib import contextmanager, suppress, ExitStack


@contextmanager
def tag(name):
    print(f"<{name}>")
    try:
        yield name
    finally:
        print(f"</{name}>")


with tag("div") as t:
    print("inside", t)

with suppress(ZeroDivisionError):
    1 / 0
print("suppressed")

with ExitStack() as stack:
    for n in ("a", "b"):
        stack.enter_context(tag(n))
