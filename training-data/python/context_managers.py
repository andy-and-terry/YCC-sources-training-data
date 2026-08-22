import contextlib
import time
from typing import Iterator


class Timer:
    """Context manager that measures elapsed wall-clock time."""

    def __enter__(self):
        self.start = time.monotonic()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.elapsed = time.monotonic() - self.start
        return False  # don't suppress exceptions


@contextlib.contextmanager
def transaction(connection) -> Iterator[None]:
    """Generator-based context manager implementing commit/rollback semantics."""
    connection.begin()
    try:
        yield
    except Exception:
        connection.rollback()
        raise
    else:
        connection.commit()


class FakeConnection:
    def __init__(self):
        self.log = []

    def begin(self):
        self.log.append("BEGIN")

    def commit(self):
        self.log.append("COMMIT")

    def rollback(self):
        self.log.append("ROLLBACK")


class SuppressAndLog(contextlib.AbstractContextManager):
    """Suppresses given exception types but records them for later inspection."""

    def __init__(self, *exception_types):
        self.exception_types = exception_types
        self.suppressed = []

    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type is not None and issubclass(exc_type, self.exception_types):
            self.suppressed.append(exc_val)
            return True
        return False


if __name__ == "__main__":
    with Timer() as t:
        time.sleep(0.01)
    print(f"elapsed: {t.elapsed:.4f}s")

    conn = FakeConnection()
    try:
        with transaction(conn):
            raise ValueError("boom")
    except ValueError:
        pass
    print(conn.log)

    suppressor = SuppressAndLog(KeyError, ValueError)
    with suppressor:
        raise KeyError("missing")
    print(suppressor.suppressed)
