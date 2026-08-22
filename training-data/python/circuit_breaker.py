import time
from enum import Enum, auto


class CircuitState(Enum):
    CLOSED = auto()
    OPEN = auto()
    HALF_OPEN = auto()


class CircuitBreaker:
    def __init__(self, failure_threshold: int = 3, reset_timeout: float = 5.0):
        self.failure_threshold = failure_threshold
        self.reset_timeout = reset_timeout
        self.failures = 0
        self.state = CircuitState.CLOSED
        self.opened_at = None

    def call(self, func, *args, **kwargs):
        if self.state == CircuitState.OPEN:
            if time.monotonic() - self.opened_at >= self.reset_timeout:
                self.state = CircuitState.HALF_OPEN
            else:
                raise RuntimeError("circuit is open")

        try:
            result = func(*args, **kwargs)
        except Exception:
            self.failures += 1
            if self.failures >= self.failure_threshold:
                self.state = CircuitState.OPEN
                self.opened_at = time.monotonic()
            raise
        else:
            self.failures = 0
            self.state = CircuitState.CLOSED
            return result


if __name__ == "__main__":
    breaker = CircuitBreaker(failure_threshold=2, reset_timeout=0.1)

    def flaky():
        raise ValueError("fail")

    for _ in range(2):
        try:
            breaker.call(flaky)
        except ValueError:
            pass
    print(breaker.state)
