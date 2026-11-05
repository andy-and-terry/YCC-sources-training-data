import contextlib
import io

with contextlib.suppress(FileNotFoundError):
    open("/no/such/file")

buf = io.StringIO()
with contextlib.redirect_stdout(buf):
    print("captured")
print(repr(buf.getvalue()))

with contextlib.ExitStack() as stack:
    for name in ("a", "b"):
        stack.callback(print, "closing", name)
    print("body")
