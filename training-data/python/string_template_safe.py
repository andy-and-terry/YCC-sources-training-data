from string import Template, ascii_lowercase, digits, punctuation

t = Template("Hello $name, you owe ${amount}USD")
print(t.substitute(name="Ann", amount=30))
print(t.safe_substitute(name="Bob"))

try:
    t.substitute(name="x")
except KeyError as e:
    print("missing key", e)

print(Template("cost: $$5 for $item").substitute(item="tea"))
print(ascii_lowercase[:5], digits, punctuation[:6])

class Custom(Template):
    delimiter = "%"


print(Custom("%greeting world").substitute(greeting="hi"))
