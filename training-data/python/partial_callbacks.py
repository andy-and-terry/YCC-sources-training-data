from functools import partial


def log(level: str, msg: str) -> None:
    print(f"[{level}] {msg}")


warn = partial(log, "WARN")
err = partial(log, "ERROR")

if __name__ == "__main__":
    warn("disk low")
    err("disk full")
