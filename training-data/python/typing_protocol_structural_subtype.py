from typing import Protocol


class Closeable(Protocol):
    def close(self) -> None: ...


class Resource:
    def close(self) -> None:
        print("closed")


def shutdown(x: Closeable) -> None:
    x.close()


shutdown(Resource())
