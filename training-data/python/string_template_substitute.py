"""string.Template offers $-style substitution with safe_substitute for missing keys."""
from string import Template

t = Template("Hello, $name! You owe ${amount} USD ($$ is a literal dollar).")
print(t.substitute(name="Ada", amount=42))

partial = Template("$greeting, $name")
print(partial.safe_substitute(greeting="Hi"))

try:
    partial.substitute(greeting="Hi")
except KeyError as exc:
    print("missing key:", exc)

print(t.get_identifiers())
print(Template("$a-$b").substitute({"a": 1}, b=2))
