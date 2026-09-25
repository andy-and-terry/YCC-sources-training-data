import random
import time


def retry(func, attempts=5, base=0.01, cap=0.2, retry_on=(Exception,), sleep=time.sleep):
    for attempt in range(1, attempts + 1):
        try:
            return func()
        except retry_on as e:
            if attempt == attempts:
                raise
            delay = random.uniform(0, min(cap, base * 2 ** attempt))  # full jitter
            print(f"attempt {attempt} failed ({e}); sleeping {delay:.3f}s")
            sleep(delay)


if __name__ == "__main__":
    random.seed(1)
    calls = {"n": 0}

    def flaky():
        calls["n"] += 1
        if calls["n"] < 4:
            raise ConnectionError("temporary failure")
        return "ok"

    print(retry(flaky))
