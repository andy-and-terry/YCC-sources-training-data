def parse(text):
    try:
        value = int(text)
    except ValueError:
        print("invalid")
        return None
    else:
        print("parsed ok")
        return value
    finally:
        print("cleanup for", repr(text))


print(parse("12"))
print(parse("x"))


def finally_overrides():
    try:
        return "try"
    finally:
        print("finally runs before the return completes")


print(finally_overrides())

for i in range(3):
    try:
        if i == 1:
            continue
    finally:
        print("loop finally", i)
