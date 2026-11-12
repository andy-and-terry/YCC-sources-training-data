def read(lines):
    for l in lines:
        yield l.strip()

def nonempty(it):
    return (x for x in it if x)

def upper(it):
    return (x.upper() for x in it)

print(list(upper(nonempty(read(["a\n", "\n", " b "])))))
