import mmap
import tempfile


if __name__ == "__main__":
    with tempfile.TemporaryFile() as f:
        f.write(b"hello world\nsecond line\nneedle here\n")
        f.flush()
        with mmap.mmap(f.fileno(), 0) as mm:
            print(mm.find(b"needle"), len(mm))
            print(mm[0:5], mm.readline())
            mm[0:5] = b"HELLO"  # in-place write, same length
            mm.seek(0)
            print(mm.read(11))
