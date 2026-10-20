import contextlib
import io
import os

# contextlib helpers: suppress expected exceptions and capture stdout.
def remove_if_present(path):
    with contextlib.suppress(FileNotFoundError):
        os.remove(path)

if __name__ == "__main__":
    remove_if_present("/nonexistent/file.txt")
    buf = io.StringIO()
    with contextlib.redirect_stdout(buf):
        print("captured")
    print(repr(buf.getvalue()))
