from contextlib import ExitStack

if __name__ == "__main__":
    with ExitStack() as stack:
        for i in range(3):
            stack.callback(print, "cleanup", i)
        print("body")
