# Python 3.9+: dict union operators. The right operand wins on key conflicts.
defaults = {"host": "localhost", "port": 8080, "debug": False}
overrides = {"port": 9090, "debug": True}

merged = defaults | overrides
print(merged)
print(defaults)  # unchanged: | builds a new dict

defaults |= {"timeout": 30}  # in-place update, accepts any mapping/iterable of pairs
print(defaults)

defaults |= [("retries", 3)]
print(defaults)

# Equivalent older spellings
print({**defaults, **overrides} == (defaults | overrides))

# Only the left operand's insertion order is kept for existing keys.
print(list(({"a": 1, "b": 2} | {"b": 3, "c": 4}).items()))
