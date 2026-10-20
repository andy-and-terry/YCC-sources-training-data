class Resource:
    def __enter__(self):
        print("acquire")
        return self

    def __exit__(self, exc_type, exc, tb):
        print("release", exc_type.__name__ if exc_type else None)
        return True


if __name__ == "__main__":
    with Resource():
        raise RuntimeError("boom")
    print("survived")
