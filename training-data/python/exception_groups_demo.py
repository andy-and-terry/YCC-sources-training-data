def risky(n):
    errors = []
    if n % 2 == 0:
        errors.append(ValueError(f"even value {n}"))
    if n % 3 == 0:
        errors.append(TypeError(f"multiple of three {n}"))
    if n > 5:
        errors.append(KeyError(n))
    if errors:
        raise ExceptionGroup(f"problems with {n}", errors)
    return n


if __name__ == "__main__":
    try:
        risky(6)
    except* ValueError as eg:
        print("value errors:", [str(e) for e in eg.exceptions])
    except* TypeError as eg:
        print("type errors:", [str(e) for e in eg.exceptions])
    except* KeyError as eg:
        print("key errors:", [e.args[0] for e in eg.exceptions])

    try:
        raise ExceptionGroup("batch", [OSError("disk"), ValueError("bad")])
    except ExceptionGroup as eg:
        matched, rest = eg.split(OSError)
        print(matched.exceptions, rest.exceptions)
