import contextlib
import io

if __name__ == "__main__":
    with contextlib.suppress(KeyError):
        {}["x"]
    buf = io.StringIO()
    with contextlib.redirect_stdout(buf):
        print("captured")
    print(repr(buf.getvalue()))
