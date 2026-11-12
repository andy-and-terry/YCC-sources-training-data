from typing import Protocol

class Closable(Protocol):
    def close(self) -> None: ...

class File:
    def close(self) -> None:
        print("file closed")

def shutdown(items: list[Closable]) -> None:
    for i in items:
        i.close()

shutdown([File(), File()])
