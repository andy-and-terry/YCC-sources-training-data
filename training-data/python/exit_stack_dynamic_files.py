import tempfile
from contextlib import ExitStack


def main() -> None:
    with ExitStack() as stack:
        files = [stack.enter_context(tempfile.TemporaryFile("w+")) for _ in range(3)]
        for i, f in enumerate(files):
            f.write(str(i))
        print(len(files), "temp files open")
    print("all closed:", all(f.closed for f in files))


if __name__ == "__main__":
    main()
