"""contextlib.ExitStack: manage a dynamic, runtime-determined number
of context managers -- and unwind them in reverse order -- without
nesting a `with` statement for each one."""

from contextlib import ExitStack, contextmanager
from typing import Iterator, List


@contextmanager
def resource(name: str, log: List[str]) -> Iterator[str]:
    log.append(f"open {name}")
    try:
        yield name
    finally:
        log.append(f"close {name}")


def open_all(names: List[str], log: List[str]) -> List[str]:
    """Open however many resources the caller asks for, all cleaned up
    together -- and in the opposite order -- once the stack exits."""
    with ExitStack() as stack:
        opened = [stack.enter_context(resource(name, log)) for name in names]
        return list(opened)


def open_with_early_failure(names: List[str], fail_at: str, log: List[str]) -> None:
    """If something goes wrong partway through, ExitStack still unwinds
    every resource that was already entered."""
    with ExitStack() as stack:
        for name in names:
            stack.enter_context(resource(name, log))
            if name == fail_at:
                raise RuntimeError(f"failed while holding {name}")


if __name__ == "__main__":
    log: List[str] = []
    result = open_all(["db", "cache", "socket"], log)
    print(result)
    print(log)

    log.clear()
    try:
        open_with_early_failure(["a", "b", "c"], fail_at="b", log=log)
    except RuntimeError as e:
        print(e)
    print(log)  # "a" and "b" were both opened, both get closed; "c" never opens
