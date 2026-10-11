class ConfigError(Exception):
    pass


def load(value):
    try:
        return int(value)
    except ValueError as e:
        raise ConfigError(f"bad config value {value!r}") from e


try:
    load("abc")
except ConfigError as e:
    print(e)
    print("cause:", repr(e.__cause__))

try:
    try:
        1 / 0
    except ZeroDivisionError:
        raise RuntimeError("secondary")
except RuntimeError as e:
    print("context:", repr(e.__context__))

try:
    try:
        1 / 0
    except ZeroDivisionError:
        raise RuntimeError("hidden") from None
except RuntimeError as e:
    print(e.__suppress_context__)
