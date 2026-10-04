"""Exception chaining with `raise from` and ExceptionGroup (3.11+)."""


class ConfigError(Exception):
    pass


def load(value):
    try:
        return int(value)
    except ValueError as exc:
        raise ConfigError(f"bad value {value!r}") from exc


def validate_all(values):
    errors = []
    for v in values:
        try:
            load(v)
        except ConfigError as e:
            errors.append(e)
    if errors:
        raise ExceptionGroup("validation failed", errors)


def main():
    try:
        load("x")
    except ConfigError as e:
        print(e, "| cause:", type(e.__cause__).__name__)
    try:
        validate_all(["1", "a", "b"])
    except* ConfigError as eg:
        print(len(eg.exceptions), "errors:", [str(e) for e in eg.exceptions])


if __name__ == "__main__":
    main()
