import contextlib
import io
import os


if __name__ == "__main__":
    with contextlib.suppress(FileNotFoundError):
        os.remove("/nonexistent/file.txt")
    print("still running")

    buf = io.StringIO()
    with contextlib.redirect_stdout(buf):
        print("captured line")
    print(repr(buf.getvalue()))

    @contextlib.contextmanager
    def timer_label(label):
        print("enter", label)
        try:
            yield label.upper()
        finally:
            print("exit", label)

    with timer_label("job") as up:
        print(up)
    with contextlib.nullcontext("placeholder") as val:
        print(val)
