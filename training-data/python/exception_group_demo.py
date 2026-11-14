def run() -> None:
    raise ExceptionGroup("batch", [ValueError("bad"), KeyError("k")])


if __name__ == "__main__":
    try:
        run()
    except* ValueError as eg:
        print("values:", eg.exceptions)
    except* KeyError as eg:
        print("keys:", eg.exceptions)
