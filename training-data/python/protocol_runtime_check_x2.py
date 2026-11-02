from typing import Protocol, runtime_checkable

@runtime_checkable
class Closeable(Protocol):
    def close(self) -> None: ...

class F:
    def close(self): print("closed")

print(isinstance(F(), Closeable), isinstance(3, Closeable))
